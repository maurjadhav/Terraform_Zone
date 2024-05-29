## defining the variables
variable "resource_group_name" {
  type        = string
  description = "This is resource group name"
}
variable "virtual_network_name" {
  type        = string
  description = "virtual network name"
}

variable "resource_group_location" {
  type        = string
  description = "This is resource group locaton"
}

variable "virtual_network_cidr" {
  type        = list(string)
  description = "This is primary network cidr range"
}

variable "subnet_names" {
  type        = list(string)
  description = "This contains default subnet names"
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "This contains default subnet cidr"
}