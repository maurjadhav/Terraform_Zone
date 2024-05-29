output "subnet_id" {
  value = module.network.subnet
}

output "nsg_group" {
  value = module.network_security_group.nsg_group
}