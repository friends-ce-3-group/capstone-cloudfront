resource "aws_wafv2_web_acl" "regional" {
  name  = "${var.proj_name}-regional-web-acl"
  scope = "REGIONAL"
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.proj_name}-regional-web-acl"
    sampled_requests_enabled   = true
  }
  default_action {
    allow {}
  }
}

resource "aws_wafv2_web_acl_association" "api_gateway" {
  resource_arn = var.api_gateway_arn
  web_acl_arn  = aws_wafv2_web_acl.regional.arn
}

resource "aws_wafv2_web_acl_association" "application_load_balancer" {
  resource_arn = var.application_load_balancer_arn
  web_acl_arn  = aws_wafv2_web_acl.regional.arn
}