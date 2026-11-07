terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}
resource "yandex_compute_instance" "bastion" {
  count = alltrue([var.env_name == "worker", var.external_acess_bastion]) ? 1 : 0

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.network_interface.0.nat_ip_address
    private_key = local.user-data
    timeout     = "60s"
  }

  name        = var.bastion_name 
  hostname    = var.bastion_name
  platform_id = var.platform

  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory / 2
    core_fraction = var.vm_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.boot_disk_type
      size     = var.boot_disk_size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.user-data}"
  }

  scheduling_policy { preemptible = var.preemptible }

  network_interface {
    subnet_id = local.worker_subnet_list.subnet_id
    nat       = true
  }
  allow_stopping_for_update = true
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
    #subnet_id  = var.env_name=="worker" ? element(local.worker_subnet_list, count.index) : element(local.master_subnet_list, count.index)
    subnet_id = element(var.subnet_ids, count.index)
    nat        = var.nat
    security_group_ids = var.security_group_ids
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
