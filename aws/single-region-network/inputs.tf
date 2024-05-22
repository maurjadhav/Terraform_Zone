variable "network_info" {
  type = object({
    name       = string
    cidr_block = string
  })
}

variable "private_subnets" {
  type = list(object({
    name       = string
    cidr_range = string
    av_zone    = string
  }))
  description = "This is the private subnet"
}

variable "public_subnets" {
  type = list(object({
    name       = string
    cidr_range = string
    av_zone    = string
  }))
  description = "This is the public subnet"
}


variable "security_group_info" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
    inbound_rules = list(object({
      cidr        = string
      port        = number
      protocol    = string
      description = string
    }))
    outbound_rules = list(object({
      cidr        = string
      from_port   = number
      protocol    = string
      description = string
      to_port     = number
    }))
    allow_all_egress = bool

  })
  description = "security group info"
}
