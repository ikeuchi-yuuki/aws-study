# terraform課題提出
いつもお世話になっております。

新カリキュラム「33_Terraformを使ったインフラのコード化と自動化」の課題提出となります。
現時点ではvpc, subnet, ec2まで構築済みです。途中段階でのレビューをお願いいたします。

---

## 課題内容
- Terraformを使って今まで作った環境を構築（vpc,subnet,ec2）

---

## 提出内容
- 下記ディレクトリ構成のtfファイル一式
- **tfvarsファイルはセキュリティ上git管理せず、内容をスクリーンショット（jpg）で提出しています**
- 構築エビデンス（apply画面、AWSコンソール画面等のスクリーンショット）

---

## ディレクトリ構成

```

├── environments/
│   └── dev/ # vpc,subnet,ec2の構成ファイル
│       ├── main.tf
│       ├── variables.tf
│       ├── provider.tf
│       ├── backend.tf   
│       └── terraform.tfvars 
│       
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── subnet/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf

```

---

## モジュール説明

下記のように各モジュールを作成し、environments/devディレクトリ内で呼び出して構成しています。

| モジュール名 |output        | 説明 |　 input |　説明  |
|------------|--------------|-----|------|-----|
|vpc        |vpc_id  igw_id | VPCとインターネットGWの作成|my_cidr_block| VPCのCIDRブロック |
| subnet    | subnet_1a_id  | サブネットとルートテーブル|vpc_id igw_id  | VPCのID、IGWのID |
| ec2       | ec2_id        | EC2インスタンス作成 |ec2_sg_id  | セキュリティグループID |
| security  |ec2_sg_id      | EC2用セキュリティグループ|vpc_id  |  VPCのID |

---

## tfvarsファイル

![変数ファイル](environments/dev/画像/変数定義ファイル.jpg)

---

## エビデンス

apply画面（ターミナル）

![apply画面](environments/dev/画像/apply.jpg)

SSH接続

![SSH接続画面](environments/dev/画像/SSH.jpg)

instance画面

![SSH接続画面](environments/dev/画像/instance.jpg)

VPC画面

![SSH接続画面](environments/dev/画像/VPC.jpg)

---

ご確認のほど、よろしくお願いいたします。
