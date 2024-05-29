# resource group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = {
    CreatedBy = "Terraform"
    Env       = "dev"
  }
}


# create the virtual network
resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = var.virtual_network_cidr
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

# create the multiple subnets
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = azurerm_resource_group.this.name
  name                 = var.subnet_names[count.index]
  address_prefixes     = [var.subnets_cidrs[count.index]]
}
