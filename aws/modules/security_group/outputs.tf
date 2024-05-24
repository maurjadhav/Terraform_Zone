output "aws_security_group" {
  value = aws_security_group.web
}

output "aws_vpc_security_group_ingress_rule" {
  value = aws_vpc_security_group_ingress_rule.web
}

output "aws_vpc_security_group_egress_rule" {
    value = aws_vpc_security_group_egress_rule.web
  
}