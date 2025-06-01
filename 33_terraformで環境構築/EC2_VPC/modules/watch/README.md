<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.messages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.spring_boot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.userdata](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.waf_blocked_requests](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名(dev, staging, prodなど) | `string` | n/a | yes |
| <a name="input_notification_email"></a> [notification\_email](#input\_notification\_email) | 通知するメールアドレス | `string` | n/a | yes |
| <a name="input_web_acl_arn"></a> [web\_acl\_arn](#input\_web\_acl\_arn) | Web\_acl\_arn用 | `string` | n/a | yes |
| <a name="input_web_acl_name"></a> [web\_acl\_name](#input\_web\_acl\_name) | Web\_acl\_名前出力用 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_messages_log_group"></a> [messages\_log\_group](#output\_messages\_log\_group) | メッセージログ |
| <a name="output_spring_boot_log_group"></a> [spring\_boot\_log\_group](#output\_spring\_boot\_log\_group) | スプリングブートログ |
| <a name="output_userdata_log_group"></a> [userdata\_log\_group](#output\_userdata\_log\_group) | ユーザーデータログ |
<!-- END_TF_DOCS -->