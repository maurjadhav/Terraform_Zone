# passing the values for the variables created
resource_group_name     = "multi-region-network"
virtual_network_name    = "primary"
resource_group_location = "central india"
virtual_network_cidr    = ["192.168.0.0/16"]
subnet_names            = ["app", "web", "db"]
subnets_cidrs           = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]

web_nsg_rules = [{
  name                       = "open_http"
  description                = "this opens 80 port"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  access                     = "Allow"
  priority                   = 1000
  },
  {
    name                       = "open_ssh"
    description                = "this opens 80 port"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 1010
}]