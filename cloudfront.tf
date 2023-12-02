# Nothing meaningful here yet, so commenting the whole file.

/**
resource "aws_cloudfront_origin_access_control" "s3_website_oac" {
  name                              = "${var.proj_name}-s3-website-origin-access-control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
**/

resource "aws_cloudfront_distribution" "s3_distribution" {

  origin {
    custom_origin_config {
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
      http_port              = "80"
      https_port             = "443"
    }
    domain_name = var.s3_bucket_website_domain_name
    origin_id   = var.s3_bucket_website_domain_name
  }

  origin {
    domain_name = var.s3_bucket_images_domain_name
    origin_id   = var.s3_bucket_images_domain_name
  }

  origin {
    custom_origin_config {
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
      http_port              = "80"
      https_port             = "443"
    }
    domain_name = var.application_load_balancer_domain_name
    origin_id   = var.application_load_balancer_domain_name
  }

  enabled = true

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  ordered_cache_behavior {
    path_pattern               = "/api/*"
    allowed_methods            = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods             = ["GET", "HEAD", "OPTIONS"]
    target_origin_id           = var.application_load_balancer_domain_name
    viewer_protocol_policy     = "allow-all"
    compress                   = true
    cache_policy_id            = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad" // Managed-CachingDisabled (a caching policy already created by AWS)
    origin_request_policy_id   = "216adef6-5c7f-47e4-b989-5492eafa07d3" // Managed-AllViewer (a caching policy already created by AWS)
    response_headers_policy_id = "60669652-455b-4ae9-85a4-c4c02393f86c" // Managed-SimpleCORS (a caching policy already created by AWS)
  }

  ordered_cache_behavior {
    path_pattern           = "/thumbnails/*"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_bucket_images_domain_name
    viewer_protocol_policy = "allow-all"
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" // Managed-CachingOptimized(a caching policy already created by AWS)
  }

  ordered_cache_behavior {
    path_pattern           = "/originals/*"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_bucket_images_domain_name
    viewer_protocol_policy = "allow-all"
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" // Managed-CachingOptimized(a caching policy already created by AWS)
  }

  ordered_cache_behavior {
    path_pattern           = "/resized/*"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_bucket_images_domain_name
    viewer_protocol_policy = "allow-all"
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" // Managed-CachingOptimized(a caching policy already created by AWS)
  }

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_bucket_website_domain_name
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6" // Managed-CachingOptimized (a caching policy already created by AWS)
    compress               = true
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }


}
