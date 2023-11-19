# Nothing meaningful here yet, so commenting the whole file.

/**
resource "aws_cloudfront_origin_access_control" "s3_website_oac" {
  name                              = "${var.proj_name}-s3-website-origin-access-control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = var.s3_bucket_static_website_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_website_oac.id
    origin_id                = var.s3_bucket_static_website_domain_name
  }

  enabled = true
  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_bucket_static_website_domain_name
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

}
**/