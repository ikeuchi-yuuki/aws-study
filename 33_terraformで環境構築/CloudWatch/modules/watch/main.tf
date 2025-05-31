# CloudWatchロググループ
resource "aws_cloudwatch_log_group" "messages" {
  name              = "${var.my_env}-messages"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "spring_boot" {
  name              = "${var.my_env}-spring-boot"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "userdata" {
  name              = "${var.my_env}-userdata"
  retention_in_days = 7
}

# SNSトピックとメール通知
resource "aws_sns_topic" "alarm" {
  name = "${var.my_env}-waf-alarm"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alarm.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

# CloudWatchアラーム（BlockedRequests）
resource "aws_cloudwatch_metric_alarm" "waf_blocked_requests" {
  alarm_name          = "${var.my_env}-waf-blocked-requests"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "BlockedRequests"
  namespace           = "AWS/WAFV2"
  period              = 60
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "許可IP以外からのアクセスを検知"
  treat_missing_data  = "notBreaching"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alarm.arn]
  dimensions = {
    WebACL = var.web_acl_name
    Rule   = "dev-waf-ipset"
    Region = "ap-northeast-1"
  }
}
