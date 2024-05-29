# resource group
resource "azurerm_resource_group" "this" {
  name     = "primary"
  location = "eastus"
  tags = {
    CreatedBy = "Terraform"
    Env       = "dev"
  }
}

# virtual network
module "network" {
  source = "../modules/network"
  network_info = {
    network_name   = "primary-network"
    network_cidr   = "10.10.0.0/16"
    group_name     = azurerm_resource_group.this.name
    group_location = azurerm_resource_group.this.location
  }
  group_name    = azurerm_resource_group.this.name
  subnet_names  = ["web-a", "web-b"]
  subnets_cidrs = ["10.10.0.0/24", "10.10.1.0/24"]
  depends_on    = [azurerm_resource_group.this]
}
