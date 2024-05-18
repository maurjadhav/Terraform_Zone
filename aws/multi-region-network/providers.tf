terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

provider "aws" {
  region = var.region # Mumbai reagion as a region
  default_tags {      # Default tags
    tags = {
      CreatedBy = "Terraform"
      Env       = "Dev"
    }
  }
}