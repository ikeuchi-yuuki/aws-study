# セキュリティグループID出力
output "ec2_sg_id" {
  description = "EC2用セキュリティグループのID"
  value       = aws_security_group.ec2_sg.id
}

output "alb_sg_id" {
  description = "alb用セキュリティグループのID"
  value       = aws_security_group.alb_sg.id
}

output "rds_sg_id" {
  description = "rds用セキュリティグループのID"
  value       = aws_security_group.rds_sg.id
}
