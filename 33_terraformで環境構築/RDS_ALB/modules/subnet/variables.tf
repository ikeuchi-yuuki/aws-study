variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "my_env" {
  description = "環境タイプ（例: dev, stg, prod など）"
  type        = string
}

variable "azs" {
  description = "利用するアベイラビリティゾーンのリスト"
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
}

variable "igw_id" {
  description = "インターネットゲートウェイのID"
  type        = string
}
