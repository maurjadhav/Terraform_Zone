## defining the variables
variable "resource_group_name" {
  type        = string
  description = "This is resource group name"
  default     = "default_name"

}
variable "resource_group_location" {
  type        = string
  description = "This is resource group locaton"
  default     = "east us"

}

variable "virtual_network_cidr" {
  type        = list(string)
  description = "This is primary network cidr range"
  default     = ["10.10.0.0/16"]
}

variable "subnet_names" {
  type        = list(string)
  description = "This contains default subnet names"
  default     = ["web", "db", "app"]
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "This contains default subnet cidr"
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]

}