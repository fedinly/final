terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}
resource "yandex_kubernetes_cluster" "k8s_cluster" {
  name = var.k8s_cls_name
  service_account_id      = var.service_account_id 
  node_service_account_id = var.service_account_id 
    depends_on = [
      var.sa-k8s-clusters-agent,
      var.sa-vpc-public-admin,
      var.sa-images-puller,
      var.sa-encrypterDecrypter
    ]
  network_id             = var.network_id
  master {
    public_ip = var.master_public_ip
    regional {
      region = var.master_region
      dynamic "location" {
        for_each = var.k8s_masters_subnet_info
        #local.m_network_output.master_subnet_list
        content {
          zone      = location.value["zone"]
          subnet_id = location.value["subnet_id"]
        }
      }
    }    
    security_group_ids = [var.sg_k8s_master]
  }
  kms_provider {
      key_id = yandex_kms_symmetric_key.kms-key.id
    }
  /*  
  scale_policy {
    auto_scale  {
      min_resource_preset_id = "s2.small"
    }
  } 
  */
  network_policy_provider = var.np_provider
}


resource "yandex_compute_placement_group" "group1" {
  name        = var.pl_group_name
  folder_id   = var.folder_id
  description = "PG for K8S Cluster"
}
