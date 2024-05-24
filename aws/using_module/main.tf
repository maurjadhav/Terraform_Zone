module "vpc" {
  source = "../modules/vpc"
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