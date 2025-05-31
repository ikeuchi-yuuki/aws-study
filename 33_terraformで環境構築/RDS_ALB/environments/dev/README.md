# terraform課題提出
いつもお世話になっております。

新カリキュラム「33_Terraformを使ったインフラのコード化と自動化」の課題提出となります。
前回までのvpc, subnet, ec2, security までに加えて
現時点ではRDS, ALB, まで構築済みです。

---

## 課題内容
- Terraformを使って今まで作った環境を構築（RDS, ALBを追加）

---

## 提出内容
- モジュール説明
- **tfvarsファイルはセキュリティ上git管理せず、内容をスクリーンショット（jpg）で提出しています**
- 構築エビデンス（apply画面）

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ../../modules/alb | n/a |
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ../../modules/ec2 | n/a |
| <a name="module_main_vpc"></a> [main\_vpc](#module\_main\_vpc) | ../../modules/vpc | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ../../modules/rds | n/a |
| <a name="module_security"></a> [security](#module\_security) | ../../modules/security | n/a |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ../../modules/subnet | n/a |
| <a name="module_watch"></a> [watch](#module\_watch) | ../../modules/watch | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | 自分のグローバルIPアドレス | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2インスタンスで使用するSSHキーペア名 | `string` | n/a | yes |
| <a name="input_my_cidr_block"></a> [my\_cidr\_block](#input\_my\_cidr\_block) | VPCのCIDRブロック | `string` | n/a | yes |
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名(dev, staging, prodなど) | `string` | n/a | yes |
| <a name="input_my_ip"></a> [my\_ip](#input\_my\_ip) | 自分のグローバルIPアドレス | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
---

## エビデンス

tfvarsファイル

![変数ファイル](画像/変数定義ファイル.jpg)

apply画面（ターミナル）

![apply画面](画像/apply.jpg)

---

ご確認のほど、よろしくお願いいたします。
