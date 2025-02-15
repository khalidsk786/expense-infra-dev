terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}
terraform {
  backend "s3" { # this will configure the backend
    bucket         = "khalidskaws82s-dev1"
    key            = "expense-bastion-app-alb" #you should change key  this to a unique name same key can't be used by multiple users
    region         = "us-east-1"
    dynamodb_table = "khalidskaws82s-dev1"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}