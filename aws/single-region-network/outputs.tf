output "aws_instance" {
  value = aws_instance.webserver

}

output "web-public-ip" {
  value = [for instance in aws_instance.webserver : instance.public_ip]
}

output "web-url" {
  value = [for instance in aws_instance.webserver : "http://${instance.public_ip}/preschool"]

}
