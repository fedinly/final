resource "yandex_vpc_network" "k8s_net" {
  name           = var.vpc_name
}
/*
resource "yandex_vpc_subnet" "db_subn" {
  count          = 2
  name           = "db_cls_net-${var.subnet_zones[count.index]}"
  network_id     = yandex_vpc_network.cls_net.id
  v4_cidr_blocks = [var.cidr_blocks_priv[count.index]]
  zone           = var.db_subnet_zones[count.index]
}

resource "yandex_vpc_subnet" "db_subn_b" {
  
  name           = "${var.vpc_name}-${var.subnet_zones[1]}"
  network_id     = yandex_vpc_network.db_net.id
  v4_cidr_blocks = [var.cidr_blocks_priv[1]]
  zone           = var.subnet_zones[1]
}

resource "yandex_vpc_subnet" "k8s_subn" {
  count          = 3
  name           = "k8s_cls_net-${var.subnet_zones[count.index]}"
  network_id     = yandex_vpc_network.db_net.id
  v4_cidr_blocks = [var.cidr_blocks_pub[count.index]]
  zone           = var.subnet_zones[count.index]
}
*/

resource "yandex_vpc_subnet" "k8s_subn" {
  for_each = {
    for k, v in local.subnet_array : "${v.name}" => v
  }
  network_id = yandex_vpc_network.cls_net.id
  v4_cidr_blocks = each.value.cidr
  zone           = each.value.zone
  name           = each.value.name
}
resource "yandex_vpc_address" "public_addr" {
  for_each = {
    for v in local.external_ips_array : "${v.name}" => v
  }
  name = each.value.name
  external_ipv4_address {
    zone_id = each.value.zone
  }
}
