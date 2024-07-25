
variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_size" {
  description = "Size of the VMs"
  type        = string
}

variable "vm_image" {
  description = "Image version for the VMs"
  type        = string
}

variable "vm_docker_ip" {
  description = "Docker IP address"
  type        = string
}
