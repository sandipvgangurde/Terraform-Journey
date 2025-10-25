variable "instance_name" {
description = "name of hte VM"
type = string
}


variable "machine_type" {
description = "machine type of the VM e3-standard-2"
type = string
}

variable "zone"{
description = "where you wan to create the VM"
type = string
}

variable "image"{
description = "which operating system you want to use and their type and size"
type = string
}

variable "network"{
description = "VPC network name vm will be deploying "
type = string
}

variable "subnetwork"{
description = "Subnetwork name where the VM will will bw deploy"
type = string
}

variable "tags" {
description = "network tagsfor the vm"
type = list(string)
default = []
}

