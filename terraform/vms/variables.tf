variable "each_vm_master" {
  type = list(object({  
    vm_name=string 
    cpu=number
    ram=number
    fraction=number
    disk_volume=number
    disk_type=string
    nat=bool
  }))
  default = []
  description = "VM master parameters"
}
variable "each_vm_worker" {
  type = list(object({  
    vm_name=string 
    cpu=number
    ram=number
    fraction=number
    disk_volume=number
    disk_type=string
    nat=bool
  }))
  default = []
  description = "VM worker parameters"
}
variable "network_id" {
  type    = string
  default = ""
  description = "Cloud network ID for VMs"
}
variable "k8s_workers_subnet_info" {
  type = list(object({
    subnet_id = string
    zone = string
  }))
  description = "From vpc output workers subnet"
  default = []  
}
variable "k8s_masters_subnet_info" {
  type = list(object({
    subnet_id = string
    zone = string
  }))
  description = "From vpc output masters subnet"
  default = []  
}