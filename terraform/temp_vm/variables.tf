variable "temp_count" {
  type = number
  default = 1
  description = "Number of VM's to create"
}

variable "platform" {
   type          = string
   default       = "standard-v3"
   description   = "VM platform."
   validation {
     condition = contains(["standard-v1", "standard-v2", "standard-v3"], var.platform)
     error_message = "Invalid platform provided."
   }
}
variable "service_account_id" {
  type = string
  default = ""
  description = "Service Account to use in VM"
}
variable "description" {
  type = string
  description = "Description of VM"
}
variable "vm_cores" {
  type    = number
  default = 2
  description ="Number of cores on VM"
}
variable "vm_memory" {
  type    = number
  default = 2
  description ="Number of memory on VM"
}
variable "vm_core_fraction" {
  type    = number
  default = 20
  description ="Number of core fraction on VM"
}
variable "boot_disk_type" {
  type    = string
  default = "network-hdd"
  description = "Boot disk type"
}
variable "boot_disk_size" {
  type    = number
  default = 15
  description = "Boot disk size"
}
variable "nat" {
  type    = bool
  default = true
  description = "Existance of public IP on VM"
}
variable "preemptible" {
  type = bool
  default = true
  description = "Preemptible setting on VM"
}
variable "security_group_ids" {
  type = list(string)
  default = []
  description = "Place in some SG"
}
variable "network_id" {
  type    = string
  default = ""
  description = "Cloud network ID for VMs"
}
variable "subnet_id" {
  type = string
  default = ""
  description = "Subnet ID for VM"
}
