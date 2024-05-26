variable "web_instances" {
  type    = list(string)
  default = ["web", "web"]
}

variable "db_instances" {
  type    = list(string)
  default = ["db", "db", "db"]
}