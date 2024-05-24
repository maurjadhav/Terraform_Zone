# creating ec2 instance
resource "aws_instance" "this" {
  count                       = length(var.ec2_instance_info)
  ami                         = var.ec2_instance_info[count.index].ami_id
  instance_type               = var.ec2_instance_info[count.index].instance_type
  key_name                    = var.ec2_instance_info[count.index].key_name
  associate_public_ip_address = var.ec2_instance_info[count.index].associate_public_ip_address
  subnet_id                   = var.ec2_instance_info[count.index].subnet_id
  security_groups             = [var.ec2_instance_info[count.index].security_group_id]
  tags = {
    Name = var.ec2_instance_info[count.index].name
  }
  user_data = var.ec2_instance_info[count.index].user_data ? file(var.ec2_instance_info.user_data_file) : ""
}