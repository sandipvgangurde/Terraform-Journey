variable "network_name" {
  description = "name of vpc network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR rangefor subnet"
  type        = string
}


variable "region" {
  description = "region of the subnet"
  type        = string
}



