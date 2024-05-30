variable "subnet_name" {
  type    = list(string)
  default = ["web", "app", "app"]
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}