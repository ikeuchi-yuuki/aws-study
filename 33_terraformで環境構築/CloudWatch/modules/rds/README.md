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
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.rds_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.rds_db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_iam_role.rds_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.rds_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.rds_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | DBユーザーネーム | `string` | n/a | yes |
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名(dev, staging, prodなど) | `string` | n/a | yes |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | EC2インスタンスで使用するSSHキーペア名 | `list(string)` | n/a | yes |
| <a name="input_rds_sg_id"></a> [rds\_sg\_id](#input\_rds\_sg\_id) | rds用セキュリティグループのID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_arn"></a> [rds\_arn](#output\_rds\_arn) | rds\_arn |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | rdsエンドポイント |
| <a name="output_rds_id"></a> [rds\_id](#output\_rds\_id) | rdsインスタンスのID |
<!-- END_TF_DOCS -->