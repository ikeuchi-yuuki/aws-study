# 許可IPセット
resource "aws_wafv2_ip_set" "allowed_ips" {
  name               = "${var.my_env}-allowed-ips"
  scope              = "REGIONAL"
  description        = "IP set containing allowed IP addresses"
  ip_address_version = "IPV4"
  addresses          = ["${var.my_ip}/32"]
}

# WebACL本体
resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.my_env}-web-acl"
  description = "Allow only my IP"
  scope       = "REGIONAL"

  default_action {
    block {}
  }

  rule {
    name     = "allow-only-from-allowed-ips"
    priority = 1
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.allowed_ips.arn
      }
    }
    action {
      allow {}
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "allow-only-from-allowed-ips-metric"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "dev-waf-ipset"
    sampled_requests_enabled   = true
  }
}

# ALBへのWebACL適用
resource "aws_wafv2_web_acl_association" "load_balancer_acl_association" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
}

# CloudWatch Logsグループ（WAFログ出力用）
resource "aws_cloudwatch_log_group" "waf_log" {
  name              = "aws-waf-logs-${var.my_env}"
  retention_in_days = 30
  tags = {
    Name = "${var.my_env}-waf-log-group"
  }
}

resource "aws_wafv2_web_acl_logging_configuration" "wafv2" {
  log_destination_configs = [aws_cloudwatch_log_group.waf_log.arn]
  resource_arn           = aws_wafv2_web_acl.web_acl.arn

  redacted_fields {
    method {}
  }
  redacted_fields {
    query_string {}
  }
  redacted_fields {
    single_header {
      name = "authorization"
    }
  }
}
