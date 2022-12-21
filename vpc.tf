module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  create_vpc = var.create_vpc
  name = "VPC for Demo Infra"
  cidr = var.vpc_cidr
  azs = var.aws_azs
  private_subnets = var.vpc_private_subnets
  public_subnets = var.public_subnets

  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  database_subnet_group_name "${var.deploy_name}-db"

}




