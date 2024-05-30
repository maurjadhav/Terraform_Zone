resource "azurerm_linux_virtual_machine_scale_set" "preschool" {
  name                = "preschool-vmss"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = "Standard_B1s"
  admin_username      = "ubuntu"
  instances           = 2
  upgrade_mode        = "Manual"

  admin_ssh_key {
    username   = "ubuntu"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  network_interface {
    name    = "preschool-nic"
    primary = true
    ip_configuration {
      name                                   = "internal"
      subnet_id                              = tolist(azurerm_subnet.this)[0].id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.this.id]
    }
  }
  custom_data = filebase64("install.sh")
  

}
