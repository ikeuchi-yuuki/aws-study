output "vpc_id" {
  description = "作成したVPCのID"
  value       = aws_vpc.main_vpc.id
}

output "igw_id" {
  description = "作成したインターネットゲートウェイのID"
  value       = aws_internet_gateway.igw.id
}
