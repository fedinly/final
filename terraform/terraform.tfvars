
env_name         = "clopro-cls"
subnet_zones     = ["ru-central1-d","ru-central1-e"]
/*
db_subnet_zones  = ["ru-central1-a","ru-central1-d"]
db_name          = "netology_db"
db_user_name     = "app"
db_protect       = "DELETION_PROTECTION_MODE_INHERITED" 
ha               = true
*/
cidr_blocks_priv = ["10.0.11.0/24","10.0.13.0/24"]
cidr_blocks_pub  = ["10.1.1.0/24","10.1.2.0/24","10.1.3.0/24", "10.1.4.0/24"]
service_account_name = "svc-k8s"
#node_service_account_name = "svc-k8s-node"
kms_provider_key_name = "kms-key"
platform         = "standard-v1"
vpc_name = "k8s_net"
master_version = "1.35"
bucket = "fedinly-final-tfstate"
/*
db_subnets = {
  "subnet" = [
    {
    cidr = [ "10.15.0.0/24" ]
    name = "db_subn_a"
    zone = "ru-central1-a"
    }
  ]
}
*/
k8s_subnets = {
  "k8s_masters" = [
    {
      name = "k8s_master_subn_e"
      zone = "ru-central1-e"
      cidr = ["10.0.4.0/24"]
    },
    {
      name = "k8s_master_subn_d"
      zone = "ru-central1-d"
      cidr = ["10.0.3.0/24"]
    }
  ],
  "k8s_workers" = [
    {
      name = "k8s_worker_subn_e"
      zone = "ru-central1-e"
      cidr = ["10.10.4.0/24"]
    },
    {
      name = "k8s_worker_subn_d"
      zone = "ru-central1-d"
      cidr = ["10.10.3.0/24"]
    }
  ],
}
#=========== external_ip ==============
external_static_ips = {
  ingress_lb = [
    {
      name = "ingress_lb_zone_ru_central1_d"
      zone = "ru-central1-d"
    }
  ]
}
#=========== security_group ==============
white_ips_for_master = ["0.0.0.0/0"] 

#=========== node_groups ==============
node_groups = {
  node-group-e = {
    platform_id    = "standard-v3",
    name           = "worker-e-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    boot_disk_type = "network-hdd",
    boot_disk_size = 16,
    zone           = "ru-central1-e",
    auto_scale = {
      min     = 1,
      max     = 3,
      initial = 1
    }
  }
  node-group-d = {
    platform_id    = "standard-v2",
    name           = "worker-d-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    boot_disk_type = "network-hdd",
    boot_disk_size = 16,
    zone           = "ru-central1-d",
    auto_scale = {
      min     = 1,
      max     = 3,
      initial = 1
    }
  }
}