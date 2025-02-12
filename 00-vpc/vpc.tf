module "vpc" {
  #source               = "../terraform-aws-vpc" or git reference from below
  source                = "git::https://github.com/khalidsk786/terraform-aws-vpc.git?ref=main"
  project_name          = var.project_name
  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  common_tags           = var.common_tags
  vpc_tags              = var.vpc_tags
  igw_tags              = var.igw_tags
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  is_peering_required   = true

}


#     source = "../terraform-aws-vpc"
#     project_name = "expense"
#     environment = "dev"
#     vpc_cidr = "10.0.0.0/16"
#     common_tags = 
