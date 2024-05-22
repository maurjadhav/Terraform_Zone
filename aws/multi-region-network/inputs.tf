variable "region" {
  type        = string
  description = "Default region"
  default     = "ap-south-1"

}

variable "vpc_name" {
  type        = string
  description = "by default vpc name"
  default     = "default_name"

}

variable "primary_network_cidr" {
  type        = string
  description = "This is primary network cidr range"
  default     = "10.10.0.0/16"
}

variable "subnet_names" {
  type        = list(string)
  description = "This contains default subnet names"
  default     = ["web", "db", "app", "data"]
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "This contains default subnet cidr"
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

variable "subnet_azs" {
  type        = list(string)
  description = "This is default avilability zones"
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1a"]

}
