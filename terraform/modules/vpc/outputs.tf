output "network_name" {
  value = yandex_vpc_network.k8s_net.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.k8s_net.id
  description = "Network ID, for using in vm module"
}
/*
output "subnet_id" {
  value=[yandex_vpc_subnet.db_subn_a.id, yandex_vpc_subnet.db_subn_b.id]
}

output "subn_a_id" {
  value = yandex_vpc_subnet.db_subn_a.id
  description = "Subnet for MySQL Srvrs"
}

output "subn_b_id" {
  value = yandex_vpc_subnet.db_subn_b.id
  description = "Subnet for MySQL Srvrs"
}
output "subnet_priv_details" {
  value = [
    for s in yandex_vpc_subnet.db_subn : {
      name = s.name
      id   = s.id
      zone = s.zone
    }
  ]
}
*/
output "subnet_pub_details" {
  value = [
    for s in yandex_vpc_subnet.k8s_subn : {
      name = s.name
      id   = s.id
      zone = s.zone
    }
  ]
}

output "k8s_masters_subnet_info" {
  value = [for k, v in var.subnets["k8s_masters"] : zipmap(["subnet_id", "zone"], [yandex_vpc_subnet.k8s_subn[v.name].id, yandex_vpc_subnet.k8s_subn[v.name].zone])]
}

output "k8s_workers_subnet_info" {
  value = [for k, v in var.subnets["k8s_workers"] : zipmap(["subnet_id", "zone"], [yandex_vpc_subnet.k8s_subn[v.name].id, yandex_vpc_subnet.k8s_subn[v.name].zone])]
}
output "sg_internal" {
  value = yandex_vpc_security_group.internal.id
}

output "sg_k8s_master" {
  value = yandex_vpc_security_group.k8s_master.id
}

output "sg_k8s_worker" {
  value = yandex_vpc_security_group.k8s_worker.id
}
