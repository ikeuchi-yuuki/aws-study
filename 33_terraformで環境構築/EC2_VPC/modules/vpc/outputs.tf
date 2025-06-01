output "vpc_id" {
  description = "VPCのID"
  value       = aws_vpc.main_vpc.id
}

output "igw_id" {
  description = "インターネットゲートウェイのID"
  value       = aws_internet_gateway.igw.id
}
