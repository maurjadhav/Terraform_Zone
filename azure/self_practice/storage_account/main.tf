resource "azurerm_resource_group" "group" {
  name     = "self_learning"
  location = "eastus"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

# declare a storage account
resource "azurerm_storage_account" "store" {
  name                     = "storageeastus"
  resource_group_name      = "self_learning"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}