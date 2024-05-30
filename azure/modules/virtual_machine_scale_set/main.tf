# creating virtual machine scale set
resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                = var.scale_set_info.name
  resource_group_name = var.scale_set_info.resource_group_name
  location            = var.scale_set_info.location
  admin_username      = var.scale_set_info.admin_username
  sku                 = var.scale_set_info.scale_sku
  instances           = var.scale_set_info.instances
  upgrade_mode        = var.scale_set_info.upgrade_mode

  admin_ssh_key {
    username   = var.scale_set_info.admin_username
    public_key = file(var.scale_set_info.public_key_path)
  }
  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  network_interface {
    name    = var.network_interface_info.interface_name
    primary = true
    ip_configuration {
      name                                   = var.network_interface_info.network_interface_name
      subnet_id                              = var.network_interface_info.subnet_id
      load_balancer_backend_address_pool_ids = var.network_interface_info.lb_backend_pool_ids
      #name                                   = "internal"
      #subnet_id                              = tolist(azurerm_subnet.this)[0].id
      #load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.this.id]
    }
  }
  custom_data = filebase64(var.scale_set_info.custom_data_file)


}
