# create public ip address
resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}


# creating network interfaace
resource "azurerm_network_interface" "this" {
  name                = var.network_interface_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  ip_configuration {
    name                          = var.public_ip_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# associate network security group with network interface
resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.network_security_group_id
}