output "aws_instance" {
  value = aws_instance.this

}

output "web-url-preschool" {
  value = [for instance in aws_instance.this : "http://${aws_instance.this.public_ip}/preschool"]

}

output "web-url-clinic" {
  value = [for instance in aws_instance.this : "http://${aws_instance.this.public_ip}/clinic"]

}