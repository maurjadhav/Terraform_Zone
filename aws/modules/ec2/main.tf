# creating ec2 instance
resource "aws_instance" "webserver" {
  count                       = length(var.ec2_instance_info)
  ami                         = var.ec2_instance_info[count.index].ami_id
  instance_type               = var.ec2_instance_info[count.index].instance_type
  key_name                    = var.ec2_instance_info[count.index].key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public[count.index].id
  security_groups             = [aws_security_group.web.id]
  tags = {
    Name = var.ec2_instance_info[count.index].name
  }
  user_data = file("install.sh")

  depends_on = [aws_security_group.web, aws_subnet.public]

}