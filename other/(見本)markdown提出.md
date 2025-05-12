# 29_CloudWatch 課題提出

## 提出内容

- **必須課題**: CloudWatchアラームの設定と確認
- **推奨課題**: EC2のOSログをCloudWatch画面上で確認

---

## 成果物一覧

| ファイル名                       | 内容説明                           |
|----------------------------------|------------------------------------|
| CFn_demo.yaml                    | CloudFormationテンプレート         |
| Cloudwatch_GP.jpg                | CloudWatchロググループ画面         |
| Cloudwatch_Logs.jpg              | CloudWatchログイベント画面         |
| alarm_Watch.jpg                  | アラーム設定画面                  |
| automation_IDPASS.jpg            | 自動化ID/PASS設定                 |
| automation_RDS.jpg               | RDS自動化設定                     |
| secret_key.jpg                   | シークレットキー設定               |

---
###
## 画像例

### CloudWatchロググループ画面

![CloudWatchロググループ画面](Cloudwatch_GP.jpg)

### CloudWatchログイベント画面

![CloudWatchログイベント画面](Cloudwatch_Logs.jpg)

---

## 注意事項・補足

- 環境ごとに設定内容が異なります。
- EC2のUserDataで自動設定を行っています。
- 詳細は `CFn_demo.yaml` を参照してください。

---

## 参考コマンド例
