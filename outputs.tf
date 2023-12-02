output "aws_cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "aws_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

resource "local_file" "write_cloudfront_domain_name" {
  content  = "CLOUDFRONT_DOMAIN_NAME=${aws_cloudfront_distribution.s3_distribution.domain_name}"
  filename = "${path.module}/cloudfront_domain_name.dat"
}