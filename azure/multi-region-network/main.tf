# create the resource group
resource "azurerm_resource_group" "group" {
  name     = "ntire"
  location = "eastus"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}
