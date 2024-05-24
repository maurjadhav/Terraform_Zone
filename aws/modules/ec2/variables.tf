# ec2
variable "ec2_instance_info" {
  type = list(object({
    name              = string
    ami_id            = string
    instance_type     = string
    key_name          = string
    subnet_id         = string
    security_group_id = string
  }))

  description = "webserver ec2 instance"

}