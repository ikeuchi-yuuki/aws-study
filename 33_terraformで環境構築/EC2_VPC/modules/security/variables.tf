variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "my_env" {
  description = "環境名(dev, staging, prodなど)"
  type        = string
}

variable "my_ip" {
  description = "SSH接続を許可するグローバルIP（x.x.x.x形式）"
  type        = string
}
