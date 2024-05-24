# creating vpc
module "vpc" {
  source = "github.com/maurjadhav/Terraform_Zone/aws/modules/vpc"
  network_info = {
    name       = "primary"
    cidr_block = "10.10.0.0/16"
  }
  private_subnets = [{
    name       = "db-a"
    cidr_range = "10.10.0.0/24"
    av_zone    = "ap-south-1a"
    },
    {
      name       = "db-b"
      cidr_range = "10.10.10.0/24"
      av_zone    = "ap-south-1b"
    },
    {
      name       = "db-c"
      cidr_range = "10.10.20.0/24"
      av_zone    = "ap-south-1c"
  }]
  public_subnets = [{
    name       = "web"
    cidr_range = "10.10.30.0/24"
    av_zone    = "ap-south-1a"
    },
    {
      name       = "web-b"
      cidr_range = "10.10.40.0/24"
      av_zone    = "ap-south-1b"
  }]

}

# creating security group for web
module "web_security_group" {
  source = "github.com/maurjadhav/Terraform_Zone/aws/modules/security_group"
  security_group_info = {
    name        = "web-sg"
    description = "web security group"
    vpc_id      = module.vpc.vpc_id
    inbound_rules = [{
      cidr        = "0.0.0.0/0"
      port        = 22
      protocol    = "tcp"
      description = "open ssh"
      }, {
      cidr        = "0.0.0.0/0"
      port        = 80
      protocol    = "tcp"
      description = "open http"
    }]
    outbound_rules   = []
    allow_all_egress = true
  }

  depends_on = [module.vpc]
}



# creating security group for db
module "db_security_group" {
  source = "github.com/maurjadhav/Terraform_Zone/aws/modules/security_group"
  security_group_info = {
    name        = "db-sg"
    description = "db security group"
    vpc_id      = module.vpc.vpc_id
    inbound_rules = [{
      cidr        = "10.10.0.0/16"
      port        = 3306
      protocol    = "tcp"
      description = "open mysql port"
    }]
    outbound_rules   = []
    allow_all_egress = true
  }

  depends_on = [module.vpc]
}