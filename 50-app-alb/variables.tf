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
  default = "Z06356134NT1HFIC4980"
}

variable "domain_name"{
    default = "khalidaws82.tech"

}