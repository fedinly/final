
  resource "yandex_vpc_security_group" "sg_internal" {
  name        = "internal"
  description = "Internal cluster traffic"
  network_id  = yandex_vpc_network.diplom_net.id
  labels = {
    firewall = "yc_internal"
  }
  ingress {
    protocol          = "ANY"
    description       = "self"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol       = "ANY"
    description    = "Allow traffic pod-pod & service-service"
    v4_cidr_blocks = flatten([for v in concat(var.subnets["k8s_masters"], var.subnets["k8s_workers"]) : v.cidr])
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol          = "ANY"
    description       = "self"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
}
resource "yandex_vpc_security_group" "sg_k8s_master" {
  name        = "k8s-master"  
  description = "Allow traffic for the cluster"
  network_id  = yandex_vpc_network.diplom_net.id
  labels = {
    firewall = "k8s-master"
  }
  ingress {
    protocol       = "TCP"
    description    = "access to api k8s"
    v4_cidr_blocks = var.allowed_ips_for_master
    port           = 443
  }
  ingress {
    protocol          = "TCP"
    description       = "access to api k8s from Yandex lb"
    predefined_target = "loadbalancer_healthchecks"
    from_port         = 0
    to_port           = 65535
  }
}

resource "yandex_vpc_security_group" "sg_k8s_worker" {
  name        = "k8s-worker"
  description = "Traffic for workers"
  network_id  = yandex_vpc_network.diplom_net.id
  labels = {
    firewall = "k8s-worker"
  }
  ingress {
    protocol       = "ANY"
    description    = "any connections"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
  egress {
    protocol       = "ANY"
    description    = "any connections"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
