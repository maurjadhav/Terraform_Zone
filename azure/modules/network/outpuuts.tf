output "subnet_ids" {
  value = azurerm_subnet.this[*].id
}