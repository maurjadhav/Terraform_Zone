variable "network_info" {
  type = object({
    name       = string
    cidr_block = string
  })
  default = {
    name       = "default"
    cidr_block = "192.168.0.0/16"
  }

}

variable "private_subnets" {
  type = list(object({
    name       = string
    cidr_range = string
    av_zone    = string
  }))
  default = [{
    name       = "default-db"
    cidr_range = "192.168.0.0/24"
    av_zone    = "ap-south-1a"
  }]
  description = "This is the private subnet"
}

variable "public_subnets" {
  type = list(object({
    name       = string
    cidr_range = string
    av_zone    = string
  }))
  default = [{
    name       = "default-web"
    cidr_range = "192.168.1.0/24"
    av_zone    = "ap-south-1b"
  }]
  description = "This is the public subnet"
}

