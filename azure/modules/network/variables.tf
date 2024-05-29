# resource group info
variable "network_info" {
  type = object({
    network_name   = string
    group_name     = string
    group_location = string
    network_cidr   = string
  })
}


variable "subnet_names" {
  type        = list(string)
  description = "This contains default subnet names"
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "This contains default subnet cidr"
}

variable "group_name" {
  type = string
}