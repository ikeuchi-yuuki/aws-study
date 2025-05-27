output "ec2_sg_id" {
  description = "EC2用セキュリティグループのID"
  value       = aws_security_group.ec2_sg.id
}
