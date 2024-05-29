# virtual network
module "network" {
  source                  = "../modules/network"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  virtual_network_name    = "primary_network"
  virtual_network_cidr    = ["10.10.0.0/16"]
  subnet_names            = ["web", "app", "db"]
  subnets_cidrs           = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}

#network security group
module "network_security_group" {
  source                  = "../modules/security_group"
  nsg_name                = "web_nsg"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  nsg_rules = [{
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
      description                = "this opens 22 port"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 1050
  }]
  depends_on = [module.network]
}


# public ip and network interface and association
module "public_ip_preschool" {
  source                    = "../modules/public_ip"
  resource_group_name       = var.resource_group_name
  resource_group_location   = var.resource_group_location
  network_security_group_id = module.network_security_group.nsg_group.id
  subnet_id                 = module.network.subnet_ids[0]
  public_ip_name            = "web_public"
  network_interface_name    = "web-network"
}


# virtual machine
module "vm-preschool" {
  source                  = "../modules/virtual_machine"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  network_interface_ids   = module.public_ip_preschool.network_interface_ids
  file_name               = "install.sh"
  vm_info = {
    # this is default UBUNTU vartiual machine specifications
    name            = "preschool"
    size            = "Standard_B1s"
    username        = "default"
    public_key_path = "~/.ssh/id_rsa.pub"
    publisher       = "canonical"
    offer           = "0001-com-ubuntu-server-jammy"
    sku             = "22_04-lts-gen2"
    version         = "latest"
  }
}



## public ip and network interface and association
#module "public_ip_clinic" {
#  source                    = "../modules/public_ip"
#  resource_group_name       = var.resource_group_name
#  resource_group_location   = var.resource_group_location
#  network_security_group_id = module.network_security_group.nsg_group.id
#  subnet_id                 = module.network.subnet_ids[1]
#  public_ip_name            = "web_public"
#  network_interface_name    = "web-network"
#}
#
## virtual machine
#module "vm-clinic" {
#  source                  = "../modules/virtual_machine"
#  resource_group_name     = var.resource_group_name
#  resource_group_location = var.resource_group_location
#  network_interface_ids   = module.public_ip.network_interface_ids
#  file_name               = "install.sh"
#  vm_info = {
#    # this is default UBUNTU vartiual machine specifications
#    name            = "clinic"
#    size            = "Standard_B1s"
#    username        = "default"
#    public_key_path = "~/.ssh/id_rsa.pub"
#    publisher       = "canonical"
#    offer           = "0001-com-ubuntu-server-jammy"
#    sku             = "22_04-lts-gen2"
#    version         = "latest"
#  }
#}

