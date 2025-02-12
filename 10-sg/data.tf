data "aws_ssm_parameter" "vpc_id" { # this is for Query parameter store value
  name = "/${var.project_name}/${var.environment}/vpc_id" # This is the path to the parameter
}