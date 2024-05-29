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
