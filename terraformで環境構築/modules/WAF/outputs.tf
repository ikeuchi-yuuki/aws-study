# WAF WEBACL名出力
output "aws_cloudwatch_log_group" { 
  description = "WAFログ出力用"
  value = aws_cloudwatch_log_group.waf_log.name 
}

output "web_acl_name" { 
  description = "Web_acl_名前出力用"
  value = aws_wafv2_web_acl.web_acl.name 
}

output "web_acl_arn" {
  description = "Web_acl_arn用"
  value = aws_wafv2_web_acl.web_acl.arn
}
