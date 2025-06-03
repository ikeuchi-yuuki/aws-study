variable "my_cidr_block" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "my_env" {
  description = "環境名(dev, staging, prodなど)"
  type        = string
}
