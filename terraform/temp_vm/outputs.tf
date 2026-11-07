output "nat_ip_address" {
  value = [ yandex_compute_instance.temp-vm.0.network_interface.0.nat_ip_address ]
}