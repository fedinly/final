data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2404-lts"
}
resource "yandex_compute_instance" "vm-master" {
  for_each = {
    for index, vm in var.each_vm: 
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
    for index, vm in var.each_vm: 
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
    subnet_id = var.k8s_workers_subnet_info
    nat       = lookup(each.value, "nat", true)
  }

  metadata = {
    user-data = local.user-data
  }
}

resource "yandex_compute_instance" "vm-temp" {
  for_each = {
    for index, vm in var.each_vm: 
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
    subnet_id = var.k8s_temp_subnet_info
    nat       = lookup(each.value, "nat", true)
  }

  metadata = {
    user-data = local.user-data
  }
}