# creating virtual machine
resource "azurerm_linux_virtual_machine" "this" {
  name                  = var.vm_info.name
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  network_interface_ids = [var.network_interface_ids]
  size                  = var.vm_info.size
  admin_username        = var.vm_info.username
  admin_ssh_key {
    username   = var.vm_info.username
    public_key = file(var.vm_info.public_key_path)
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.vm_info.publisher
    offer     = var.vm_info.offer
    sku       = var.vm_info.sku
    version   = var.vm_info.version
  }
  custom_data = filebase64(var.file_name)

}
