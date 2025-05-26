# サブネット関連（パブリック2、プライベート２）
output "public_subnet_1a_id" {
  description = "パブリックサブネット1aのID"
  value       = aws_subnet.public_1a.id
}
