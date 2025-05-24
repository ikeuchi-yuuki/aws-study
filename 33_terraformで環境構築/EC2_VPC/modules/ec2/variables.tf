variable "key_name" {
  description = "EC2インスタンスで使用するSSHキーペア名"
  type        = string
}

variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "public_subnet_1a_id" {
  description = "EC2を配置するパブリックサブネット1aのID"
  type        = string
}

variable "my_ip" {
  description = "SSH接続を許可するグローバルIPアドレス"
  type        = string
}

variable "my_env" {
  description = "環境名（例: dev, stg, prod）"
  type        = string
}
