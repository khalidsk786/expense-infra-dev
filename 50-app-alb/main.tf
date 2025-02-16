module "alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true
  #expense-dev-app-alb
  name    = "${var.project_name}-${var.environment}-app-alb"
  vpc_id  = data.aws_ssm_parameter.vpc_id.value # reffering data from state management
  subnets = local.private_subnet_ids # referring sunets from locals # here need to mention local name only
  create_security_group = false # not creating security group here # here need to mention local name only
  security_groups = [local.app_alb_sg_id] # reffering data from locals
  enable_deletion_protection = false # this is witll delete every records
tags = merge(
    var.common_tags,
    {
    Name    = "${var.project_name}-${var.environment}-app-alb"
    
   }
  )
}
# creating ALB listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type = "fixed-response"

    fixed_response{
      content_type = "text/plain"
      message_body = "<h1> Hello iam from backend app alb</h1>"
      status_code  = "200"
    
  }
 }
}


#route53 records 
resource "aws_route53_record" "app_alb" {
zone_id = var.zone_id
name = "*.app-dev.${var.domain_name}"
type = "A"

alias {
name = module.alb.dns_name #taking reference form dns name
zone_id = module.alb.zone_id #taking reference from zone id
evaluate_target_health = false
}
}