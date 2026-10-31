variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr3q4XMUJOIlOWLSTiBku/QtmX2t4qtGtIaZW+wy52V fedinly@gmail.com"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "env_name" {
  type        = string
  default     = "MySQL"
}
variable "subnet_zones" {
  type        = list(string)
  default     = []
}
/*
variable "db_subnet_zones" {
  type        = list(string)
  default     = []
}
variable "db_name" {
  type        = string
}
variable "db_user_name" {
  type        = string
}
variable "db_user_pass" {
  type        = string
}
variable "db_protect" {
  type        = string
  default     = "DELETION_PROTECTION_MODE_ENABLED" 
}
variable "ha" {
  type        = bool
}
*/
variable "vpc_name" {
  type        = string
}
variable "cidr_blocks_priv" {
  type        = list(string)
}
variable "cidr_blocks_pub" {
  type        = list(string)
}
variable "external_static_ips" {
  type        = map(list(object(
    {
      name    = string,
      zone    = string
    }))
  )
}
variable "service_account_name" {
  type        = string
}
#variable "node_service_account_name" {
  #type = string
#}
variable "kms_provider_key_name" {
  type        = string
}
variable "np_provider" {
  type        = string
  default     = "CALICO"
}
variable "env_name_k8s" {
  type        = string
  default     = "K8S"
}
variable "platform" {
  type        = string
}
variable "k8s_subnets" {
  description = "Subnets for k8s"
  type        = map(list(object(
    {
      name    = string,
      zone    = string,
      cidr    = list(string)
    }))
  )
}
/*
variable "db_subnets" {
  description = "Subnets for MySQL Cls"
  type        = map(list(object(
    {
      name    = string,
      zone    = string,
      cidr    = list(string)
    }))
  )
}
*/
variable "master_region" {
  type = string
  default = "ru-central1"   
}
variable "master_version" {
  type = string
}
variable "master_public_ip" {
  description = "Boolean flag. When true, Kubernetes master will have a external ipv4 address."
  type = bool
  default = true
}
variable "node_groups" {
  description = "Parameters of Kubernetes node groups."
  
  default = {}
}
variable "white_ips_for_master" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}
variable "k8s_cls_name" {
  type = string
  default = "k8s_cluster"
}

variable "bucket" {
  type = string
}
variable "region" {
  type = string
  default = "ru-central1"
}