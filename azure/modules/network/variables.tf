# resource group info
variable "network_info" {
  type = object({
    network_name   = string
    group_name     = string
    group_location = string
    network_cidr   = string
  })
}
