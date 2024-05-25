# ec2
variable "instance_info" {
  type = object({
    name                        = string
    ami_id                      = string
    instance_type               = string
    key_name                    = string
    user_data                   = bool
    user_data_file              = string
    associate_public_ip_address = bool
    subnet_id                   = string
    security_group_id           = string
  })

  description = "webserver ec2 instance"

}