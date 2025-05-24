output "ec2_instance_id" {
  description = "EC2インスタンスのID"
  value       = aws_instance.ec2.id
}

output "ec2_security_group_id" {
  description = "EC2インスタンス用セキュリティグループのID"
  value       = aws_security_group.ec2_sg.id
}
