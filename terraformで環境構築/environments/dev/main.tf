# VPCの作成
module "main_vpc" {
  source        = "../../modules/vpc"
  my_cidr_block = var.my_cidr_block
  my_env        = var.my_env
}

# サブネットおよびルートテーブルの作成
module "subnet" {
  source = "../../modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  igw_id = module.main_vpc.igw_id
  my_env = var.my_env
  azs    = ["ap-northeast-1a", "ap-northeast-1c"]
}

# EC2modules呼び出し
module "ec2" {
  source              = "../../modules/ec2"
  key_name            = var.key_name
  vpc_id              = module.main_vpc.vpc_id
  my_env              = var.my_env
  my_ip               = var.my_ip
  public_subnet_1a_id = module.subnet.public_subnet_1a_id
  ec2_sg_id           = module.security.ec2_sg_id
}
# ALBモジュール呼び出し
module "alb" {
  source            = "../../modules/alb"
  my_env            = var.my_env
  vpc_id            = module.main_vpc.vpc_id
  public_subnet_ids = [module.subnet.public_subnet_1a_id, module.subnet.public_subnet_1c_id]
  alb_sg_id         = module.security.alb_sg_id
  ec2_instance_id   = module.ec2.ec2_instance_id
}

# RDSモジュール呼び出し
module "rds" {
  source             = "../../modules/rds"
  my_env             = var.my_env
  private_subnet_ids = [module.subnet.private_subnet_1a_id, module.subnet.private_subnet_1c_id]
  rds_sg_id          = module.security.rds_sg_id
  db_username        = var.db_username
}

# セキュリティグループの作成
module "security" {
  source = "../../modules/security"
  vpc_id = module.main_vpc.vpc_id
  my_env = var.my_env
  my_ip  = var.my_ip
}

# CloudWatch（watch）モジュール呼び出し
module "watch" {
  source             = "../../modules/watch"
  my_env             = var.my_env
  notification_email = var.notification_email
  web_acl_name       = module.waf.web_acl_name
  web_acl_arn        = module.waf.web_acl_arn
}
module "waf" {
  source  = "../../modules/WAF"
  my_env  = var.my_env
  my_ip   = var.my_ip
  alb_arn = module.alb.alb_arn
}
