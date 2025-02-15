resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mysql_sg_id" # This is the path to the parameter
  type  = "String"
  # value = module.mqsql_sg.sg_id
  value = module.mysql_sg.sg_id # sg_id refers from root module 
}
resource "aws_ssm_parameter" "backend_sg_id" {
  name  = "/${var.project_name}/${var.environment}/backend_sg_id" # This is the path to the parameter
  type  = "String"
  value = module.backend_sg.sg_id
}
resource "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/${var.project_name}/${var.environment}/frontend_sg_id" # This is the path to the parameter
  type  = "String"
  value = module.frontend_sg.sg_id
}
# for bastion ssm parameters
resource "aws_ssm_parameter" "bastion_sg_id" {
  name  = "/${var.project_name}/${var.environment}/bastion_sg_id" # This is the path to the parameter
  type  = "String"
  value = module.bastion_sg.sg_id
}
#stroing in parametr store
resource "aws_ssm_parameter" "app_alb_sg_id" {
  name  = "/${var.project_name}/${var.environment}/app_alb_sg_id" # This is the path to the parameter
  type  = "String"
  value = module.app_alb_sg.sg_id
}
