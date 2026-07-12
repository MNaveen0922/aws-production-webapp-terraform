module "vpc" {

  source = "../modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_1_cidr = var.public_subnet_1_cidr

  public_subnet_2_cidr = var.public_subnet_2_cidr

  private_subnet_1_cidr = var.private_subnet_1_cidr

  private_subnet_2_cidr = var.private_subnet_2_cidr

  az1 = var.az1

  az2 = var.az2

}

module "iam" {

  source = "../modules/iam"

  project_name = var.project_name

  environment = var.environment

}

module "security_group" {

  source = "../modules/security-group"

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id

}

module "ec2" {

  source = "../modules/ec2"

  project_name = var.project_name

  environment = var.environment

  private_subnet_1_id = module.vpc.private_subnet_1_id

  private_subnet_2_id = module.vpc.private_subnet_2_id

  security_group_id = module.security_group.ec2_security_group_id

  instance_profile_name = module.iam.instance_profile_name

  ami_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

}