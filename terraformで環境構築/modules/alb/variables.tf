# ALB用変数定義
variable "my_env" {
  description = "環境名(dev, staging, prodなど)"
  type = string 
}

variable "alb_sg_id" {
  description = "alb用セキュリティグループのID"
  type = string 
}

variable "vpc_id" {
  description = "VPCのID"
  type = string 
}

variable "public_subnet_ids" {
  description = "パブリックサブネットのID"
  type = list(string) 
}

variable "ec2_instance_id" {
  description = "EC2インスタンスID"
  type        = string
}
