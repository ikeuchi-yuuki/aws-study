output "ec2_instance_id" {
  description = "EC2インスタンスのID"
  value       = aws_instance.ec2.id
}
