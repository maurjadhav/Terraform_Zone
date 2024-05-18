# passing the values for the variables created
resource_group_name     = "multi-region"
resource_group_location = "central india"
virtual_network_cidr    = ["192.168.0.0/16"]
subnet_names            = ["app", "web", "db"]
subnets_cidrs           = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]