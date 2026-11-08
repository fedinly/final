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
variable "sg_internal" {
  type = string
}
variable "sg_k8s_worker" {
  type = string
}
variable "sg_k8s_master" {
  type = string
}
variable "subnet_zones" {
  type    = list(string)
  default = []
}
variable "service_account_name" {
  type = string
}
variable "k8s_cls_name" {
  type = string
}
variable "kms_provider_key_name" {
  description = "KMS key name"
  type = string
  default = null
}
variable "folder_id" {
  type = string
}
variable "np_provider" {
  type = string
  default = "CALICO"
}
variable "k8s_scale" {
  description = "Параметры масштабироания node group k8s"
  type = object({
    min   = number
    max   = number
    start = number
  })
  default = {
    min   = 3
    max   = 6
    start = 3
  }
}
variable "env_name_k8s" {
  type = string
}
variable "platform" {
  type = string
}
variable "pl_group_name" {
  type = string
  default = "pg01"
}
variable "node_groups" {
  description = "Parameters of Kubernetes node groups."
  default = {}
}
variable "master_public_ip" {
  type    = bool
  default = true
}
variable "master_region" {
  type    = string
  default = "ru-central1"
}
variable "master_version" {
  type = string
}
