region               = "ap-south-2"
vpc_name             = "primary_network"
primary_network_cidr = "192.168.0.0/16"

subnet_names = ["web", "db",  "app", "data" ]

subnet_azs = ["ap-south-2a", "ap-south-2b", "ap-south-2c", "ap-south-2a" ]

subnets_cidrs = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24",
  "192.168.3.0/24"]