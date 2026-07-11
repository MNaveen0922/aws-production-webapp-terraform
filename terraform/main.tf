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