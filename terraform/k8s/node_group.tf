resource "yandex_kubernetes_node_group" "k8s_workers" {
  for_each    = var.node_groups
  cluster_id  = yandex_kubernetes_cluster.k8s_cluster.id
  name        = each.key
  description = lookup(each.value, "description", null)
  version     = lookup(each.value, "version", var.master_version)
  labels      = lookup(each.value, "labels", null)
  depends_on = [ yandex_kubernetes_cluster.k8s_cluster ]
  instance_template {
    platform_id = lookup(each.value, "platform_id", null)
    name        = lookup(each.value, "name", null)
    placement_policy {
      placement_group_id = yandex_compute_placement_group.group1.id
    }
    network_interface {
      nat                = lookup(each.value, "nat", true)
      subnet_ids         = [lookup(local.worker_subnet_list, each.value["zone"])]
      security_group_ids = [var.sg_internal, var.sg_k8s_worker]
    }
    resources {
      memory = lookup(each.value, "memory", 2)
      cores  = lookup(each.value, "cores", 2)
    }
    boot_disk {
      type = lookup(each.value, "boot_disk_type", "network-hdd")
      size = lookup(each.value, "boot_disk_size", 32)
    }
    scheduling_policy {
      preemptible = lookup(each.value, "preemptible", true)
    }
    metadata = {
      ssh-keys = "ubuntu:${local.user-data}"
    }
    container_runtime {
      type = "containerd"
    }
  }
  scale_policy {
    dynamic "auto_scale" {
      for_each = flatten([lookup(each.value, "auto_scale", [])])
      content {
        min     = auto_scale.value.min
        max     = auto_scale.value.max
        initial = auto_scale.value.initial
      }
    }
  }
  allocation_policy {
    location {
      zone = each.value["zone"]
    }
  }
}