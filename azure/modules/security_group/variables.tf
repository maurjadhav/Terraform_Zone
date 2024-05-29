variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    description                = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    priority                   = number
  }))
  description = "web nsg rules"
}