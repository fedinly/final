output "vms" {
  description = "List of created VM's and IP's"
  value = {
    for k, v in yandex_compute_instance.vm : k => {
      name = v.name
      ip   = v.network_interface[0].nat_ip_address != "" ? v.network_interface[0].nat_ip_address : v.network_interface[0].ip_address
    }
  }
}
output "bastion" {
  description = "Created bastion VM"
  value = [ yandex_compute_instance.bastion.0.network_interface.0.nat_ip_address ]
}
