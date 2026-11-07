terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_compute_instance" "temp-vm" {

  count = var.temp_count
  #depends_on = [yandex_compute_instance.bastion]


  name        = "temp-${count.index}"
  hostname    = "msvc-${count.index}"
  platform_id = var.platform
  description        = "${var.description}"

  provisioner "local-exec" {
    command    = "eval $(ssh-agent) && cat ~/.ssh/id_ed25519 | ssh-add -"
    on_failure = continue #Продолжить выполнение terraform pipeline в случае ошибок

  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install -y software-properties-common",
      "sudo add-apt-repository -y ppa:deadsnakes/ppa",
      "sudo apt-get update",
      "sudo apt-get install -y python3.12 git"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_ed25519")
      host        = self.network_interface.0.nat_ip_address
      timeout     = "120s"
    }
  }

  # Запуск ansible-playbook
  provisioner "local-exec" {
    # without secrets
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${abspath(path.module)}/../../ansible/inventory/hosts.yml ${abspath(path.module)}/../../ansible/site.yml"

  #   #secrets pass
  #   #> nonsensitive(jsonencode( {for k,v in random_password.each: k=>v.result}))
  #   /*
  #     "{\"netology-develop-platform-web-0\":\"u(qzeC#nKjp*wTOY\",\"netology-develop-platform-web-1\":\"=pA12\\u0026C2eCl[Oe$9\"}"
  #   */
  #   # command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${abspath(path.module)}/for.ini ${abspath(path.module)}/test.yml --extra-vars '{\"secrets\": ${jsonencode({ for k, v in random_password.each : k => v.result })} }'"

  #   # for complex cases instead  --extra-vars "key=value", use --extra-vars "@some_file.json"

  #   on_failure  = continue #Продолжить выполнение terraform pipeline в случае ошибок
  #   environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  #   #срабатывание триггера при изменении переменных
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

  metadata = {
    ssh-keys = "ubuntu:${local.user-data}"
  }

  scheduling_policy { 
    preemptible = var.preemptible
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  allow_stopping_for_update = true
}