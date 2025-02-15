data "aws_ami" "joindevops" {
  #executable_users = ["self"]
  most_recent      = true
 # name_regex       = "^myami-[0-9]{3}"
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
 
data "aws_ssm_parameter" "bastion_sg_id" { # this is for Query parameter store value
  name = "/${var.project_name}/${var.environment}/bastion_sg_id" # This is the path to the parameter
}

data "aws_ssm_parameter" "public_subnet_ids" { # if we want to install the vpc if specicific subnet
name = "/${var.project_name}/${var.environment}/public_subnet_ids" 
}
