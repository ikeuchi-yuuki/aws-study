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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名(dev, staging, prodなど) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_messages_log_group"></a> [messages\_log\_group](#output\_messages\_log\_group) | メッセージログ |
| <a name="output_spring_boot_log_group"></a> [spring\_boot\_log\_group](#output\_spring\_boot\_log\_group) | スプリングブートログ |
| <a name="output_userdata_log_group"></a> [userdata\_log\_group](#output\_userdata\_log\_group) | ユーザーデータログ |
<!-- END_TF_DOCS -->