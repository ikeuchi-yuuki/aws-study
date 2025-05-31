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
