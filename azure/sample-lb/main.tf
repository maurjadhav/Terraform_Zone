resource "azurerm_resource_group" "this" {
  name     = "primary"
  location = "eastus"
}

resource "azurerm_virtual_network" "this" {
  name                = "primary"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = ["10.10.0.0/16"]
}


resource "azurerm_subnet" "this" {
  count                = length(var.subnet_name)
  name                 = var.subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.subnet_cidr[count.index]]
}