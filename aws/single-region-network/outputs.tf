output "aws_security_group" {
    value = aws_security_group.web.id
}

output "aws_vpc" {
  value = aws_vpc.primary.id
}

output "aws_subnet" {
  value = aws_subnet.public
}