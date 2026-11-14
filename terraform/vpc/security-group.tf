resource "yandex_vpc_security_group" "internal" {
  name        = "internal"
  description = "Managed by terraform"
  network_id  = yandex_vpc_network.cls_net.id
  labels = {
    firewall = "yc_internal"
  }
  ingress {
    description       = "Incoming service traffic between the master and the nodes."
    from_port         = 0
    to_port           = 65535
    protocol          = "ANY"
    predefined_target = "self_security_group"
  }
  egress {
    description       = "Outgoing service traffic between the master and the nodes."
    from_port         = 0
    to_port           = 65535
    protocol          = "ANY"
    predefined_target = "self_security_group"
  }
}

resource "yandex_vpc_security_group" "sg_k8s_master" {
  name        = "sg_k8s-master"
  description = "Allow traffic for the cluster"
  network_id  = yandex_vpc_network.diplom_net.id
  labels = {
    firewall = "k8s-master"
  }
  ingress {
    description    = "Allowed access to api k8s (port 443)"
    protocol       = "TCP"
    v4_cidr_blocks = var.allowed_ips_for_master
    port           = 443
  }
  ingress {
    description    = "Allowed access to api k8s (port 6443)"
    protocol       = "TCP"
    v4_cidr_blocks = var.allowed_ips_for_master
    port           = 6443
  }
  ingress {
    description    = "Allows incoming to connect to k8s services"
    from_port      = 30000
    to_port        = 32767
    protocol       = "TCP"
    v4_cidr_blocks = var.allowed_ips_for_master
  }
  egress {
    description    = "For outgoing traffic allows transfer between the master and metric-server pods."
    port           = 4443
    protocol       = "TCP"
    v4_cidr_blocks = [var.k8s_svcs_ipv4_cidr]
  } 
}

resource "yandex_vpc_security_group" "sg_k8s_worker" {
  name        = "k8s-worker"
  description = "Managed by terraform"
  network_id  = yandex_vpc_network.cls_net.id
  labels = {
    firewall = "k8s-worker"
  }
  ingress {
    protocol       = "ANY"
    description    = "Allow any between pods and services"
    v4_cidr_blocks = [var.k8s_pods_ipv4_cidr, var.k8s_svcs_ipv4_cidr]
    from_port      = 0
    to_port        = 65535
  }
  ingress {
    description    = "Allow SSH connection to nodes"
    port           = 22
    protocol       = "TCP"
    v4_cidr_blocks = var.allowed_ips_for_master
  }
  egress {
    protocol       = "ANY"
    description    = "Allow nodes to connect to external"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
