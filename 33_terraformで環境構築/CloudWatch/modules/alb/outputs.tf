# ALB出力
output "alb_arn" {
  description = "alb_arn"
  value = aws_lb.alb.arn 
}

output "alb_dns_name" {
  description = "rdsのDNS名"
  value = aws_lb.alb.dns_name 
}

output "target_group_arn" {
  description = "alb_tg_arn"
  value = aws_lb_target_group.alb_tg.arn 
}
