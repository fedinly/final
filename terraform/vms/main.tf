terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_compute_instance" "vm-master" {
  for_each = {
    for index, vm in var.each_vm_master: 
    vm.vm_name => vm
  }
  name = each.value.vm_name
    
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
      type = each.value.disk_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = var.k8s_masters_subnet_info
    nat       = lookup(each.value, "nat", true)
  }

  metadata = {
    user-data = local.user-data
  }
}

resource "yandex_compute_instance" "vm-worker" {
  for_each = {
    for index, vm in var.each_vm_worker: 
    vm.vm_name => vm
  }
  name = each.value.vm_name
    
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
      type = each.value.disk_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_ids         = [lookup(local.worker_subnet_list, each.value["zone"])]
    security_group_ids = [var.sg_internal, var.sg_k8s_worker]
    nat       = lookup(each.value, "nat", true)
  }

  metadata = {
    user-data = local.user-data
  }
}