terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
  default_tags { # Default tags
    tags = {
      CreatedBy = "Terraform"
      Env       = "Dev"
    }
  }
}