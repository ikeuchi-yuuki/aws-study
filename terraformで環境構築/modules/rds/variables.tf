# RDS用変数
variable "my_env" { 
  description = "環境名(dev, staging, prodなど)"
  type = string 
}

variable "private_subnet_ids" { 
  description = "EC2インスタンスで使用するSSHキーペア名"
  type = list(string) 
}

variable "rds_sg_id" { 
  description = "rds用セキュリティグループのID"
  type = string 
}

variable "db_username" { 
  description = "DBユーザーネーム"
  type = string 
}
