
locals {
  w_network_output = var.k8s_workers_subnet_info
  worker_subnet_list = zipmap([for subnet in local.w_network_output : subnet.zone], [for subnet in local.w_network_output: subnet.subnet_id])
  m_network_output = var.k8s_masters_subnet_info
  master_subnet_list = zipmap([for subnet in local.m_network_output : subnet.zone], [for subnet in local.m_network_output: subnet.subnet_id])
  #user-data = "${file("~/.ssh/id_ed25519.pub")}"
}
