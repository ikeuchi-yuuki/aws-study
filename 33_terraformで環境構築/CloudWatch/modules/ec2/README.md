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
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ssm_parameter.al2023_latest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_sg_id"></a> [ec2\_sg\_id](#input\_ec2\_sg\_id) | EC2用セキュリティグループのID | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2インスタンスで使用するSSHキーペア名 | `string` | n/a | yes |
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名（例: dev, stg, prod） | `string` | n/a | yes |
| <a name="input_my_ip"></a> [my\_ip](#input\_my\_ip) | SSH接続を許可するグローバルIPアドレス | `string` | n/a | yes |
| <a name="input_public_subnet_1a_id"></a> [public\_subnet\_1a\_id](#input\_public\_subnet\_1a\_id) | パブリックサブネット1aのID | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPCのID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | EC2インスタンスのID |
<!-- END_TF_DOCS -->