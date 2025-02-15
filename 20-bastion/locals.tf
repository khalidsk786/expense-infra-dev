locals {
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]# if we want to install the vpc if specicific subnet
}