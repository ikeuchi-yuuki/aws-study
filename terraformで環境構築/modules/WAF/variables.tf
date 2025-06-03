# WAF WEBACL用変数
variable "my_env" { 
  description = "環境名(dev, staging, prodなど)"
  type = string 
}

variable "my_ip" {
  description = "SSH接続を許可するグローバルIPアドレス"
  type        = string
}

variable "alb_arn" {
  description = "albのarn"
  type        = string
}
