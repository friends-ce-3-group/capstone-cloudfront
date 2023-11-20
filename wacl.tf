resource "aws_wafv2_web_acl" "regional" {
  name  = "${var.proj_name}-regional-web-acl"
  scope = "REGIONAL"
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.proj_name}-regional-web-acl"
    sampled_requests_enabled   = true
  }

  default_action {
    block {}
  }

  rule {
    name     = "application-load-balancer-api-all"
    priority = 0
    statement {
      byte_match_statement {
        search_string = "/api"
        field_to_match {
          uri_path {}
        }
        positional_constraint = "CONTAINS"
        text_transformation {
          priority = 0
          type     = "NONE"
        }
      }
    }
    action {
      allow {}
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "application-load-balancer-api-all"
    }
  }

  rule {
    name     = "api-gateway-upload-images-options-http-method"
    priority = 1
    statement {
      byte_match_statement {
        search_string = "OPTIONS"
        field_to_match {
          method {}
        }
        text_transformation {
          priority = 0
          type     = "NONE"
        }
        positional_constraint = "EXACTLY"
      }
    }
    action {
      allow {}
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "api-gateway-upload-images-options-http-method"
    }
  }

  rule {
    name     = "api-gateway-upload-images-put-http-method"
    priority = 2
    statement {
      byte_match_statement {
        search_string = "PUT"
        field_to_match {
          method {}
        }
        text_transformation {
          priority = 0
          type     = "NONE"
        }
        positional_constraint = "EXACTLY"
      }
    }
    action {
      allow {}
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "api-gateway-upload-images-put-http-method"
    }
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