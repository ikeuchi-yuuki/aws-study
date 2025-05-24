output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "作成したVPCのID"
}

output "igw_id" {
  description = "作成したインターネットゲートウェイのID"
  value       = aws_internet_gateway.igw.id
}
