resource "azurerm_resource_group" "storage" {
  name     = "storage"
  location = "Central India"
}

resource "azurerm_storage_account" "example" {
  name                     = "fromtfmay24"
  resource_group_name      = azurerm_resource_group.storage.name
  location                 = azurerm_resource_group.storage.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "staging"
  }
}