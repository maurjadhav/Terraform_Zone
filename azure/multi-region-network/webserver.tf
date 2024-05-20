# create public ip address
resource "azurerm_public_ip" "web-public-ip" {
  name                = "web-public"
  resource_group_name = azurerm_resource_group.group.name
  location            = var.resource_group_location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  depends_on = [azurerm_resource_group.group]


}


# create network security group
resource "azurerm_network_security_group" "web-nsg" {
  name                = "web-nsg"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }

  depends_on = [azurerm_resource_group.group]

}

# create network security rule
resource "azurerm_network_security_rule" "for-web" {
  count                       = length(var.web_nsg_rules)
  resource_group_name         = azurerm_resource_group.group.name
  network_security_group_name = azurerm_network_security_group.web-nsg.name
  name                        = var.web_nsg_rules[count.index].name
  description                 = var.web_nsg_rules[count.index].description
  protocol                    = var.web_nsg_rules[count.index].protocol
  source_port_range           = var.web_nsg_rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.web_nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_nsg_rules[count.index].destination_address_prefix
  access                      = var.web_nsg_rules[count.index].access
  priority                    = var.web_nsg_rules[count.index].priority
  direction                   = "Inbound"
  depends_on                  = [azurerm_resource_group.group, azurerm_virtual_network.primary]

}


# creating network interfaace
resource "azurerm_network_interface" "web-nic" {
  name                = "web-nic"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  ip_configuration {
    name                          = "web_ip"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web-public-ip.id
  }
}

# associate network security group with network interface
resource "azurerm_network_interface_security_group_association" "web_nsg-to-web" {
  network_interface_id      = azurerm_network_interface.web-nic.id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
  depends_on                = [azurerm_network_interface.web-nic, azurerm_network_security_group.web-nsg]

}

# creating virtual machine
resource "azurerm_linux_virtual_machine" "webserver" {
  name                  = var.vm_info.name
  resource_group_name   = azurerm_resource_group.group.name
  location              = azurerm_resource_group.group.location
  network_interface_ids = [azurerm_network_interface.web-nic.id]
  size                  = var.vm_info.size
  admin_username        = var.vm_info.username
  admin_ssh_key {
    username   = var.vm_info.username
    public_key = file(var.vm_info.public_key_path)
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.vm_info.publisher
    offer     = var.vm_info.offer
    sku       = var.vm_info.sku
    version   = var.vm_info.version
  }

}