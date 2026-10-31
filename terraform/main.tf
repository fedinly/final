module "vpc" {
  source   = "git::https://github.com/fedinly/final.git//terraform/modules/vpc"
  vpc_name = "k8s-net"
  subnets  = var.k8s_subnets
  cidr_blocks_priv = var.cidr_blocks_priv
  cidr_blocks_pub = var.cidr_blocks_pub
  subnet_zones = var.subnet_zones
  external_static_ips = var.external_static_ips
  white_ips_for_master = var.white_ips_for_master
  bucket = var.bucket
  region = var.region
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
}