# RDS出力
output "rds_endpoint" { 
  description = "rdsエンドポイント"
  value = aws_db_instance.rds.endpoint 
}

output "rds_id" { 
  description = "rdsインスタンスのID"
  value = aws_db_instance.rds.id 
}

output "rds_arn" { 
  description = "rds_arn"
  value = aws_db_instance.rds.arn 
}
