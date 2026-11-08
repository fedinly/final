output "network_name" {
  value = yandex_vpc_network.diplom_net.name
  description = "Network name to use in k8s module"
}

output "network_id" {
  value = yandex_vpc_network.diplom_net.id
  description = "Network ID, for use in k8s module"
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
*/
output "subnet_pub_details" {
  value = [
    for s in yandex_vpc_subnet.diplom_k8s_subnet: {
      name = s.name
      id   = s.id
      zone = s.zone
    }
  ]
  description = "Subnet parameters"
}
output "k8s_masters_subnet_info" {
  value = [for k, v in var.subnets["k8s_masters"] : zipmap(["subnet_id", "zone"], [yandex_vpc_subnet.k8s_subn[v.name].id, yandex_vpc_subnet.k8s_subn[v.name].zone])]
  description = "Subnet parameters for masters"
}

output "k8s_workers_subnet_info" {
  value = [for k, v in var.subnets["k8s_workers"] : zipmap(["subnet_id", "zone"], [yandex_vpc_subnet.k8s_subn[v.name].id, yandex_vpc_subnet.k8s_subn[v.name].zone])]
  description = "Subnet parameters for workers"
}
output "sg_internal" {
  value = yandex_vpc_security_group.internal.id
  description = "Parameters of Security group internal "
}

output "sg_k8s_master" {
  value = yandex_vpc_security_group.k8s_master.id
  description = "Parameters of Security group for masters "
}

output "sg_k8s_worker" {
  value = yandex_vpc_security_group.k8s_worker.id
  description = "Parameters of Security grour for workers"
}
