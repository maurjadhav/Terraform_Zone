output "aws_instance" {
  value = aws_instance.this

}

output "web-url-preschool" {
  value = [for instance in aws_instance.this : "http://${instance.public_ip}/preschool"]

}

output "web-url-clinic" {
  value = [for instance in aws_instance.this : "http://${instance.public_ip}/clinic"]

}