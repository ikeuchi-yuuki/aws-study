# CloudWatch用変数
variable "my_env" { 
  description = "環境名(dev, staging, prodなど)"
  type = string 
}

variable "notification_email" { 
  description = "通知するメールアドレス"
  type = string 
}

variable "web_acl_name" {
  description = "Web_acl_名前出力用"
  type = string
}
variable "web_acl_arn" {
  description = "Web_acl_arn用"
  type = string
}
