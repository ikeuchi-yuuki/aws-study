module "main_vpc" {
  source        = "../../modules/vpc"
  my_cidr_block = var.my_cidr_block
  my_env        = var.my_env
}

module "subnet" {
  source = "../../modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  igw_id = module.main_vpc.igw_id
  my_env = var.my_env
  azs    = ["ap-northeast-1a", "ap-northeast-1c"]
}

module "ec2" {
  source              = "../../modules/ec2"
  key_name            = var.key_name
  vpc_id              = module.main_vpc.vpc_id
  my_env              = var.my_env
  my_ip               = var.my_ip
  public_subnet_1a_id = module.subnet.public_subnet_1a_id
}
