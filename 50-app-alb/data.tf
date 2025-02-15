data "aws_ssm_parameter" "vpc_id" { # this is for Query parameter store value
  name = "/${var.project_name}/${var.environment}/vpc_id" # This is the path to the parameter
}

data "aws_ssm_parameter" "private_subnet_ids" { # this is for Query parameter store value
  name = "/${var.project_name}/${var.environment}/private_subnet_ids" # This is the path to the parameter
}

data "aws_ssm_parameter" "app_alb_sg_id" { # this is for Query parameter store value
  name = "/${var.project_name}/${var.environment}/app_alb_sg_id"
}

