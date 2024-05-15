# declare a resource group
resource "azurerm_resource_group" "group" {
  name     = "learning"
  location = "centralindia"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

# declare a storage account
resource "azurerm_storage_account" "store" {
  name = "qtstore"
  # this is implicite dependency
  resource_group_name = azurerm_resource_group.group.name
  # this is implicite dependency
  location                 = azurerm_resource_group.group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  # explicit dependency
  depends_on = [azurerm_resource_group.group]
}

resource "azurerm_storage_account" "store_again" {
  name                     = "qtstoreagain"
  resource_group_name      = azurerm_resource_group.group.name
  location                 = azurerm_resource_group.group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  # explicit dependency
  depends_on = [azurerm_resource_group.group]
}