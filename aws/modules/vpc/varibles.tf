# vpc
variable "network_info" {
  type = object({
    name       = string
    cidr_block = string
  })
}

# Private subnet
variable "private_subnets" {
  type = list(object({
    name       = string
    cidr_range = string
    av_zone    = string
  }))
  description = "This is the private subnet"
}

# Public subnet
variable "public_subnets" {
  type = list(object({
    name       = string
    cidr_range = string
    av_zone    = string
  }))
  description = "This is the public subnet"
}