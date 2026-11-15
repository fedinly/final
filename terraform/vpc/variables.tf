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
  default     = "diplom_net"
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
  description = "Subnet parameters for using in k8ssss"
}
#=========== external_ip ==============
variable "external_ips" {
  description = "Hosts Static IP's"

  type = map(list(object(
    {
      name = string,
      zone = string
    }))
  )
}
#=========== security_group ==============
variable "allowed_ips_for_master" {
  type        = list(string)
  description = "IP's where allow to connect to Hosts"
}
variable "k8s_pods_ipv4_cidr" {
  type = string
  description = "IP for k8s pods addresses"
}
variable "k8s_svcs_ipv4_cidr" {
  type = string
  description = "IP for k8s service addresses"
}
variable "masters_ipv4_cidr_blocks" {
  type = list(string)
  default = [ "10.0.4.0/24", "10.0.3.0/24", "10.0.2.0/24"]
}
