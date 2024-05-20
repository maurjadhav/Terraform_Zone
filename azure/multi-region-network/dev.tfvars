# passing the values for dev enviornment creation
resource_group_name     = "multi-region-network"
virtual_network_name    = "primary"
resource_group_location = "central india"
virtual_network_cidr    = ["192.168.0.0/16"]
subnet_names            = ["web", "app", "db"]
subnets_cidrs           = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]

web_nsg_rules = [{
  name                       = "open_http"        # http allow
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
    name                       = "open_ssh"       # ssh access allow
    description                = "this opens 80 port"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 1010
}]

vm_info = {
  name            = "webserver"
  size            = "Standard_B1s"
  username        = "preschool-1"
  public_key_path = "~/.ssh/id_rsa.pub"
  publisher       = "canonical"
  offer           = "0001-com-ubuntu-server-jammy"
  sku             = "22_04-lts-gen2"
  version         = "latest"
}