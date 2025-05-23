terraform {
  backend "s3" {
    bucket = "tf-handson-aws-study"
    key    = "chapter-5/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
