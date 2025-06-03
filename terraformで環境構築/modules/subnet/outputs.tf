# サブネット関連（パブリック2、プライベート２）
output "public_subnet_1a_id" {
  description = "パブリックサブネット1aのID"
  value       = aws_subnet.public_1a.id
}

output "public_subnet_1c_id" {
  description = "パブリックサブネット1cのID"
  value       = aws_subnet.public_1c.id
}

output "private_subnet_1a_id" {
  description = "プライベートブネット1aのID"
  value       = aws_subnet.private_1a.id
}

output "private_subnet_1c_id" {
  description = "プライベートサブネット1cのID"
  value       = aws_subnet.private_1c.id
}
