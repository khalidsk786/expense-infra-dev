variable "project_name" {
  default = "expense"
}
variable "environment" {
  default = "dev"

}


variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }

}
variable "zone_id"{
  default = "Z055912513FT6GIT79WGV"
}

variable "domain_name"{
    default = "khalidaws82.tech"

}