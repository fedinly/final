data "terraform_remote_state" "iam" {
  backend = "local"
  config = {
    path = "./iam/terraform.tfstate"
  }

}

module "vpc" {
  source                 = "git::https://github.com/fedinly/final.git//terraform/vpc"
  vpc_name               = var.vpc_name
  subnets                = var.k8s_subnets
  cidr_blocks_priv       = var.cidr_blocks_priv
  cidr_blocks_pub        = var.cidr_blocks_pub
  subnet_zones           = var.subnet_zones
  external_ips           = var.external_ips
  allowed_ips_for_master = var.allowed_ips_for_master
  #bucket                 = var.bucket
  #region                 = var.region
  cloud_id               = var.cloud_id
  folder_id              = var.folder_id
}

output "k8s_subnet_worker" {
  value = module.vpc.k8s_workers_subnet_info
}
output "k8s_subnet_master" {
  value = module.vpc.k8s_masters_subnet_info
}

module "k8s_cluster" {
  source       = "git::https://github.com/fedinly/final.git//terraform/k8s"
  k8s_cls_name = var.k8s_cls_name
  env_name     = var.env_name
  network_id   = module.vpc.network_id
  k8s_workers_subnet_info =    module.vpc.k8s_workers_subnet_info
  k8s_masters_subnet_info =   module.vpc.k8s_masters_subnet_info
  subnet_zones = var.subnet_zones
  folder_id    = var.folder_id
  service_account_name = var.service_account_name
  #node_service_account_name = var.node_service_account_name
  platform     = var.platform
  env_name_k8s = var.env_name_k8s
  np_provider  = var.np_provider
  master_version = var.master_version
  sg_internal = module.vpc.sg_internal
  sg_k8s_worker = module.vpc.sg_k8s_worker
  sg_k8s_master = module.vpc.sg_k8s_master
  node_groups = var.node_groups
  depends_on = [ module.vpc ]
}
