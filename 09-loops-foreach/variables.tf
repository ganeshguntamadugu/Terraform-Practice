variable "instance_type" {
  type        = map
  default     = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

#Route53
variable "zone_id" {
    default = "Z04145091EI26FOSI2CQV"
}

variable "domain_name" {
    default = "gangs.shop"
}