# create network security group
resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

# create network security rule
resource "azurerm_network_security_rule" "this" {
  count                       = length(var.nsg_rules)
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
  name                        = var.nsg_rules[count.index].name
  description                 = var.nsg_rules[count.index].description
  protocol                    = var.nsg_rules[count.index].protocol
  source_port_range           = var.nsg_rules[count.index].source_port_range
  destination_port_range      = var.nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_rules[count.index].destination_address_prefix
  access                      = var.nsg_rules[count.index].access
  priority                    = var.nsg_rules[count.index].priority
  direction                   = "Inbound"
}
