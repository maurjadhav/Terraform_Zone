output "subnet_id" {
  value = module.network.subnet_ids
}

output "nsg_group" {
  value = module.network_security_group.nsg_group.name
}

output "web-url-preschool" {
  value = "http://${module.vm-preschool.v_machine}/preschool"
}

#utput "web-url-clinic" {
#
# value = "http://${module.vm-clinic.v_machine}/clinic"
#