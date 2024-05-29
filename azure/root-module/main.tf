# virtual network
module "network" {
  source                  = "../modules/network"
  resource_group_name     = "primary"
  resource_group_location = "eastus"
  virtual_network_name    = "primary_network"
  virtual_network_cidr    = ["10.10.0.0/16"]
  subnet_names            = ["web", "app", "db"]
  subnets_cidrs           = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}

#network security group
module "network_security_group" {
  source                  = "../modules/security_group"
  nsg_name                = "web_nsg"
  resource_group_name     = "primary"
  resource_group_location = "eastus"


  nsg_rules = [{
    name                       = "openhttp"
    description                = "this opens 80 port"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 1000
  }]
  depends_on = [module.network]
}
