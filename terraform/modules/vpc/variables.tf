variable "subnet_zones" {
  type    = list(string)
}
variable "db_subnet_zones" {
  type    = list(string)
}
variable "cidr_blocks_priv" {
  type    = list(string)
}
variable "cidr_blocks_pub" {
  type    = list(string)
}
variable "vpc_name" {
  type    = string
  default = "cls_net"
}
variable "subnets" {
  type = map(list(object(
    {
      name = string,
      zone = string,
      cidr = list(string)
    }))
  )
}
#=========== external_ip ==============
variable "external_static_ips" {
  description = "Static IP's"

    type = map(list(object(
      {
        name = string,
        zone = string
      }))
    )
}
#=========== security_group ==============
variable "white_ips_for_master" {
  type = list(string)
}