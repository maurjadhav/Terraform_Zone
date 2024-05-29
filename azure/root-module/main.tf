# resource group
resource "azurerm_resource_group" "this" {
  name     = "primary"
  location = "eastus"
  tags = {
    CreatedBy = "Terraform"
    Env       = "dev"
  }
}


module "network" {
  source = "../modules/network"
  network_info = {
    network_name   = "primary-network"
    network_cidr   = "10.10.0.0/16"
    group_name     = azurerm_resource_group.this.name
    group_location = azurerm_resource_group.this.location
  }
  depends_on = [azurerm_resource_group.this]
}
