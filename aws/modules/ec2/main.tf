# creating ec2 instance
resource "aws_instance" "this" {
  ami                         = var.instance_info.ami_id
  instance_type               = var.instance_info.instance_type
  key_name                    = var.instance_info.key_name
  associate_public_ip_address = var.instance_info.associate_public_ip_address
  subnet_id                   = var.instance_info.subnet_id
  security_groups             = [var.instance_info.security_group_id]
  tags = {
    Name = var.instance_info.name
  }
  user_data = var.instance_info.user_data ? file(var.instance_info.user_data_file) : ""
}