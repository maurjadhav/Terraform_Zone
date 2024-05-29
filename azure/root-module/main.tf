# virtual network
module "network" {
  source                  = "../modules/network"
  resource_group_name     = "primary"
  resource_group_location = "eastus"
  virtual_network_name    = "primary_network"
  virtual_network_cidr    = ["10.10.0.0/16"]
  subnet_names = [ "web", "app", "db" ]
  subnets_cidrs = [ "10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24" ]
}
