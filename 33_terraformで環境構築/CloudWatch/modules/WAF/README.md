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
| [aws_cloudwatch_log_group.waf_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_wafv2_ip_set.allowed_ips](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_ip_set) | resource |
| [aws_wafv2_web_acl.web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_association.load_balancer_acl_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |
| [aws_wafv2_web_acl_logging_configuration.wafv2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_arn"></a> [alb\_arn](#input\_alb\_arn) | albのarn | `string` | n/a | yes |
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名(dev, staging, prodなど) | `string` | n/a | yes |
| <a name="input_my_ip"></a> [my\_ip](#input\_my\_ip) | SSH接続を許可するグローバルIPアドレス | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudwatch_log_group"></a> [aws\_cloudwatch\_log\_group](#output\_aws\_cloudwatch\_log\_group) | WAFログ出力用 |
| <a name="output_web_acl_arn"></a> [web\_acl\_arn](#output\_web\_acl\_arn) | Web\_acl\_arn用 |
| <a name="output_web_acl_name"></a> [web\_acl\_name](#output\_web\_acl\_name) | Web\_acl\_名前出力用 |
<!-- END_TF_DOCS -->