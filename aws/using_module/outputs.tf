output "vpc_ip" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}


output "url-preschool" {
  value = [for instance in module.web_instance : "http://${instance.aws_instance.public_ip}/preschool"]

}

output "url-clinic" {
  value = [for instance in module.web_instance : "http://${instance.aws_instance.public_ip}/clinic"]

}

output "db_instances_private_ip" {
  value =[for instance in module.db_instance : instance.aws_instance.private_ip ]
}