variable "each_vm" {
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
}
variable "network_id" {
  type    = string
  default = ""  
}
variable "k8s_workers_subnet_info" {
  type = list(object({
    subnet_id = string
    zone = string
  }))
  description = "From vpc output workers"
  default = []  
}
variable "k8s_masters_subnet_info" {
  type = list(object({
    subnet_id = string
    zone = string
  }))
  description = "From vpc output masters"
  default = []  
}
variable "k8s_temp_subnet_info" {
  type = list(object({
    subnet_id = string
    zone = string
  }))
  description = "From vpc output temp"
  default = []  
}