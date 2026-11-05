variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "subnet_zones" {
  type        = list(string)
  description = "Avaliable subnet zones to use"
}
variable "cidr_blocks_priv" {
  type        = list(string)
  description = "CIDR blocks for private net"
}
variable "cidr_blocks_pub" {
  type        = list(string)
  description = "CIDR blocks for public net"
}
variable "vpc_name" {
  type        = string
  default     = "k8s_net"
  description = "VM network name"
}
variable "subnets" {
  type = map(list(object(
    {
      name = string,
      zone = string,
      cidr = list(string)
    }))
  )
  description = "Subnet parameters for using in VM"
}
#=========== external_ip ==============
variable "external_static_ips" {
  description = "VM Static IP's"

  type = map(list(object(
    {
      name = string,
      zone = string
    }))
  )
}
#=========== security_group ==============
variable "white_ips_for_master" {
  type        = list(string)
  description = "IP's where allow to connect to VMs"
}
variable "bucket" {
  type        = string
  description = "bucket info"
}
variable "region" {
  type        = string
  default     = "ru-central1"
  description = "Region for bucket"
}
