## defining the variables
variable "resource_group_name" {
    type = string
    description = "This is resource group name"
    default = "ntiar"
  
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

variable "web_subnet_cidr" {
  type        = string
  description = "This is web subnet cidr range"
  default     = "10.10.0.0/24"
}

variable "db_subnet_cidr" {
  type        = string
  description = "This is db subnet cidr range"
  default     = "10.10.1.0/24"
}