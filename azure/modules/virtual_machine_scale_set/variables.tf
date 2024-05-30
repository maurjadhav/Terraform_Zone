variable "scale_set_info" {
  type = list(object({
    name                = string
    resource_group_name = string
    location            = string
    admin_username      = string
    scale_sku           = string
    public_key_path     = string
    instances           = number
    upgrade_mode        = string
    custom_data_file    = string
  }))

}

variable "source_image_reference" {
  type = list(object({
    publisher = string
    offer     = string
    sku       = string
    varsion   = string
  }))
  default = [{
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }]
}

variable "network_interface_info" {
  type = list(object({
    interface_name         = string
    network_interface_name = string
    subnet_id              = string #your creates subnet id
    lb_backend_pool_ids    = string #lb bakckend address pool id
  }))
}
