output "aws_security_group" {
  value = aws_security_group.this
}

output "aws_vpc_security_group_ingress_rule" {
  value = aws_vpc_security_group_ingress_rule.this
}

output "aws_vpc_security_group_egress_rule" {
    value = aws_vpc_security_group_egress_rule.this
  
}