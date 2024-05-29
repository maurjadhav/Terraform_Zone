variable "resource_group_location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "network_interface_ids" {
  type = string
}

variable "file_name" {
  type = string
}

variable "vm_info" {
  type = object({
    name            = string
    size            = string
    username        = string
    public_key_path = string
    publisher       = string
    offer           = string
    sku             = string
    version         = string
  })
}
