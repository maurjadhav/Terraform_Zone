## defining the variables
variable "resource_group_name" {
  type        = string
  description = "This is resource group name"
  default     = "default_resource_group_name"

}
variable "virtual_network_name" {
  type        = string
  description = "virtual network name"
  default     = "default_virtual_network_name"

}

variable "resource_group_location" {
  type        = string
  description = "This is resource group locaton"
  default     = "east us"

}

variable "virtual_network_cidr" {
  type        = list(string)
  description = "This is primary network cidr range"
  default     = ["10.10.0.0/16"]
}

variable "subnet_names" {
  type        = list(string)
  description = "This contains default subnet names"
  default     = ["default_web", "default_db", "default_app"]
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "This contains default subnet cidr"
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]

}

variable "web_nsg_rules" {
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
  default = [{
    name                       = "openhttp"
    description                = "this opens 80 port"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 1000
  }]

}