provider "aws" {
  region = var.region
}

module "vpc_module" {
  source    = "./modules/vpc"
  vpc_cidr  = var.r_vpc_cidr
  pub_cidr  = var.r_pub_cidr
  priv_cidr = var.r_priv_cidr
}

module "ec2_module" {
  source     = "./modules/ec2"
  vpc_id     = module.vpc_module.vpc_id
  subnet_id  = module.vpc_module.pub_subnet_id
  ami        = var.r_ami
  key_pair_name = var.existing_key_name
  type       = var.r_type
  ssh_port   = var.r_ssh_port
  allowed_ip = var.r_allowed_ip
}

module "s3_module" {
  source      = "./modules/s3"
  bucket_name = var.r_bucket_name
}

