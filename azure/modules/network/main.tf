# virtual network creation
resource "azurerm_virtual_network" "this" {
  name                = var.network_info.network_name
  resource_group_name = var.network_info.group_name
  location            = var.network_info.group_location
  address_space       = [var.network_info.network_cidr]
  tags = {
    CreatedBy = "Terraform"
  }
}


# create the multiple subnets
resource "azurerm_subnet" "this" {
  count                = length(var.subnet_names)
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.group_name
  name                 = var.subnet_names[count.index]
  address_prefixes     = [var.subnets_cidrs[count.index]]
}
