# CloudWatchロググループ名出力
output "messages_log_group" { 
  description = "メッセージログ"
  value = aws_cloudwatch_log_group.messages.name 
}

output "spring_boot_log_group" { 
  description = "スプリングブートログ"
  value = aws_cloudwatch_log_group.spring_boot.name 
}

output "userdata_log_group" { 
  description = "ユーザーデータログ"
  value = aws_cloudwatch_log_group.userdata.name 
}
