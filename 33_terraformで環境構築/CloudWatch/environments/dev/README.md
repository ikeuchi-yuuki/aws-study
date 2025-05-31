# terraform課題提出
いつもお世話になっております。

新カリキュラム「33_Terraformを使ったインフラのコード化と自動化」の課題提出となります。
前回までのvpc, subnet, ec2, security までに加えて
RDS, ALB, WAF, CloudWatch まで構築を行いました。

---

## 課題内容
- Terraformを使って今まで作った環境を構築（RDS, ALB, WAF CloudWatchを追加）
- アラームの設定を独自ルールとし、アラームを受け取る

---

## 提出内容
- モジュール説明
- **tfvarsファイルはセキュリティ上git管理せず、内容をスクリーンショット（jpg）で提出しています**
- 構築エビデンス（apply画面,アラーム受取画面）
 
 ルール設定（独自ルールアラームの条件を自身のIPアドレスのみを接続許可し、それ以外を拒否の設定をしメールにてアラームを受け取る）

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.98.0 |

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
| <a name="module_waf"></a> [waf](#module\_waf) | ../../modules/WAF | n/a |
| <a name="module_watch"></a> [watch](#module\_watch) | ../../modules/watch | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | DB用ユーザーネーム | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2インスタンスで使用するSSHキーペア名 | `string` | n/a | yes |
| <a name="input_my_cidr_block"></a> [my\_cidr\_block](#input\_my\_cidr\_block) | VPCのCIDRブロック | `string` | n/a | yes |
| <a name="input_my_env"></a> [my\_env](#input\_my\_env) | 環境名(dev, staging, prodなど) | `string` | n/a | yes |
| <a name="input_my_ip"></a> [my\_ip](#input\_my\_ip) | 自分のグローバルIPアドレス | `string` | n/a | yes |
| <a name="input_notification_email"></a> [notification\_email](#input\_notification\_email) | 通知用のメールアドレス | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
---

## エビデンス

tfvarsファイル

![変数ファイル](画像/変数定義ファイル.jpg)

自身のIP許可設定

![IP許可](画像/IP許可設定.jpg)

WebACL画面

![WebACL](画像/WebACL.jpg)

グラフ（アラーム）

![グラフ](画像/グラフ.jpg)

メール内容

![メール](画像/メール内容.jpg)

ログ設定

![ログ設定](画像/ログ設定.jpg)

条件設定

![条件設定](画像/条件設定.jpg)

---

ご確認のほど、よろしくお願いいたします。
