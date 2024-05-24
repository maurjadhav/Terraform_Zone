output "aws_instance" {
  value = aws_instance.webserver.public_ip

}

output "web-url-preschool" {
  value = [for instance in aws_instance.webserver : "http://${instance.public_ip}/preschool"]

}

output "web-url-clinic" {
  value = [for instance in aws_instance.webserver : "http://${instance.public_ip}/clinic"]

}