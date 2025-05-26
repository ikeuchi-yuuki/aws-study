terraform {
  backend "s3" {
    bucket = "terraform-aws-study"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
