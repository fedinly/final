# k8s module
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_compute_placement_group.group1](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_placement_group) | resource |
| [yandex_kubernetes_cluster.k8s_cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster) | resource |
| [yandex_kubernetes_cluster_iam_member.sa-cluster-manager](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster_iam_member) | resource |
| [yandex_kubernetes_node_group.k8s_workers](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_env_name_k8s"></a> [env\_name\_k8s](#input\_env\_name\_k8s) | Specified cluster name | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | n/a | `string` | n/a | yes |
| <a name="input_k8s_cls_name"></a> [k8s\_cls\_name](#input\_k8s\_cls\_name) | n/a | `string` | n/a | yes |
| <a name="input_k8s_masters_subnet_info"></a> [k8s\_masters\_subnet\_info](#input\_k8s\_masters\_subnet\_info) | From vpc output masters | <pre>list(object({<br/>    subnet_id = string<br/>    zone      = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_scale"></a> [k8s\_scale](#input\_k8s\_scale) | Параметры масштабирования node group k8s | <pre>object({<br/>    min   = number<br/>    max   = number<br/>    start = number<br/>  })</pre> | <pre>{<br/>  "max": 6,<br/>  "min": 3,<br/>  "start": 3<br/>}</pre> | no |
| <a name="input_k8s_workers_subnet_info"></a> [k8s\_workers\_subnet\_info](#input\_k8s\_workers\_subnet\_info) | From vpc output workers | <pre>list(object({<br/>    subnet_id = string<br/>    zone      = string<br/>  }))</pre> | `[]` | no |
| <a name="input_kms-key-id"></a> [kms-key-id](#input\_kms-key-id) | Assigned KMS key with SA | `map` | `{}` | no |
| <a name="input_kms_provider_key_name"></a> [kms\_provider\_key\_name](#input\_kms\_provider\_key\_name) | KMS key name | `string` | `null` | no |
| <a name="input_master_public_ip"></a> [master\_public\_ip](#input\_master\_public\_ip) | Is cluster have or not external IP | `bool` | `true` | no |
| <a name="input_master_region"></a> [master\_region](#input\_master\_region) | Zone placement for master | `string` | `"ru-central1"` | no |
| <a name="input_master_version"></a> [master\_version](#input\_master\_version) | Specified version for master | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | `""` | no |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | Parameters of Kubernetes node groups. | `map` | `{}` | no |
| <a name="input_np_provider"></a> [np\_provider](#input\_np\_provider) | n/a | `string` | `"CALICO"` | no |
| <a name="input_pl_group_name"></a> [pl\_group\_name](#input\_pl\_group\_name) | Placement group name | `string` | `"pg01"` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Specified a platform for nodes | `string` | n/a | yes |
| <a name="input_sa-encrypterDecrypter"></a> [sa-encrypterDecrypter](#input\_sa-encrypterDecrypter) | Assigned role to manage KMS for SA | `map` | `{}` | no |
| <a name="input_sa-images-puller"></a> [sa-images-puller](#input\_sa-images-puller) | Assigned role to pull images for SA | `map` | `{}` | no |
| <a name="input_sa-k8s-cluster-api"></a> [sa-k8s-cluster-api](#input\_sa-k8s-cluster-api) | Assigned role to  manage cluster for SA | `map` | `{}` | no |
| <a name="input_sa-k8s-clusters-agent"></a> [sa-k8s-clusters-agent](#input\_sa-k8s-clusters-agent) | Assigned role cluster agent | `map` | `{}` | no |
| <a name="input_sa-vpc-public-admin"></a> [sa-vpc-public-admin](#input\_sa-vpc-public-admin) | Assigned role to manage VPC for SA | `map` | `{}` | no |
| <a name="input_scale_policy"></a> [scale\_policy](#input\_scale\_policy) | n/a | `string` | `"s-c2-m8"` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_sg_internal"></a> [sg\_internal](#input\_sg\_internal) | n/a | `string` | n/a | yes |
| <a name="input_sg_k8s_master"></a> [sg\_k8s\_master](#input\_sg\_k8s\_master) | n/a | `string` | n/a | yes |
| <a name="input_sg_k8s_worker"></a> [sg\_k8s\_worker](#input\_sg\_k8s\_worker) | n/a | `string` | n/a | yes |
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | variable "sg\_k8s\_master\_each" { type = string } | `list(string)` | `[]` | no |

## Outputs

No outputs.
