module "mysql_sg" {
    source = "git::https://github.com/khalidsk786/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    sg_description = "Created for MySQL instances in expense dev"
    vpc_id = data.aws_ssm_parameter.vpc_id.value # querying data existing source or runtime
    common_tags = var.common_tags
}

module "backend_sg" {
    source = "git::https://github.com/khalidsk786/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "backend"
    sg_description = "Created for backend instances in expense dev"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
}
# refering code from https://github.com/khalidsk786/terraform-aws-securitygroup.git
module "frontend_sg" {
    source = "git::https://github.com/khalidsk786/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "frontend"
    sg_description = "created for frontend instances in expense dev"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
}
# for bastion security group cration
module "bastion_sg" {
    source = "git::https://github.com/khalidsk786/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "bastion"
    sg_description = "created for bastion instances in expense dev"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
}


# for bastion security group cration
module "app_alb_sg" {
    source = "git::https://github.com/khalidsk786/terraform-aws-securitygroup.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "app_alb"
    sg_description = "created for backend ALB in expense dev"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = var.common_tags
}
#App ALB accepting traffic from bastion
resource "aws_security_group_rule" "app_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.app_alb_sg.sg_id
}

resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["59.182.39.156/32"]
  security_group_id = module.bastion_sg.sg_id
}