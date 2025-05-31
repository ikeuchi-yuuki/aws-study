variable "my_cidr_block" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "my_env" {
  description = "環境名(dev, staging, prodなど)"
  type        = string
}

variable "key_name" {
  description = "EC2インスタンスで使用するSSHキーペア名"
  type        = string
}

variable "my_ip" {
  description = "自分のグローバルIPアドレス"
  type        = string
}

variable "db_username" {
  description = "自分のグローバルIPアドレス"
  type        = string
}
