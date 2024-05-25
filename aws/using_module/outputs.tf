output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "web_security_group" {
  value = module.web_security_group
}

output "url-preschool" {
  value = [for instance in module.web_instance :"http://${aws_instance.this.public_ip}/preschool"]
}