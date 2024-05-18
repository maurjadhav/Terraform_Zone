# create the virtual network
resource "azurerm_virtual_network" "primary" {
  name                = "primary"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  address_space       = var.virtual_network_cidr
  depends_on          = [azurerm_resource_group.group]
}

# create the multiple subnets
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  virtual_network_name = azurerm_virtual_network.primary.name
  resource_group_name  = azurerm_resource_group.group.name
  name                 = var.subnet_names[count.index]
  address_prefixes     = [var.subnets_cidrs[count.index]]
  depends_on           = [azurerm_virtual_network.primary]
}