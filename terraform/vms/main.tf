terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_compute_instance" "vm" {
  count = var.vm_count

  name               = "${var.env_name}-${count.index}"
  platform_id        = var.platform
  hostname           = "${var.env_name}-${count.index}"
  zone               = element(var.subnet_zones, count.index)
  service_account_id = var.service_account_id
  description        = "${var.description}"
  scheduling_policy {
    preemptible = var.preemptible
  }
  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.boot_disk_type
      size     = var.boot_disk_size
    }
  }
  network_interface {
    subnet_id  = var.env_name=="worker" ? [ local.worker_subnet_list ] : [ local.master_subnet_list ] 
    nat        = var.nat
    security_group_ids = var.env_name=="worker" ? [var.sg_internal, var.sg_k8s_worker] : [var.sg_internal, var.sg_k8s_master]
  }

  allow_stopping_for_update = true

  lifecycle {
    ignore_changes = [
      boot_disk,
    ]
  }
  metadata = {
    user-data = local.user-data
  }
}