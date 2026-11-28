## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.12.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_k8s_cluster"></a> [k8s\_cluster](#module\_k8s\_cluster) | git::https://github.com/fedinly/final.git//terraform/k8s | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/fedinly/final.git//terraform/vpc | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [terraform_remote_state.iam](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_allowed_ips_for_master"></a> [allowed\_ips\_for\_master](#input\_allowed\_ips\_for\_master) | Allowed external IPs to connect to k8s cluster | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | sS3 bucket name | `string` | n/a | yes |
| <a name="input_cidr_blocks_priv"></a> [cidr\_blocks\_priv](#input\_cidr\_blocks\_priv) | CIDR blocks for private subnet | `list(string)` | n/a | yes |
| <a name="input_cidr_blocks_pub"></a> [cidr\_blocks\_pub](#input\_cidr\_blocks\_pub) | CIDR blocks for public subnet | `list(string)` | n/a | yes |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_env_name_k8s"></a> [env\_name\_k8s](#input\_env\_name\_k8s) | Environment | `string` | `"K8S"` | no |
| <a name="input_external_ips"></a> [external\_ips](#input\_external\_ips) | External IPs for project | <pre>map(list(object(<br/>    {<br/>      name = string,<br/>      zone = string<br/>    }))<br/>  )</pre> | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_k8s_cls_name"></a> [k8s\_cls\_name](#input\_k8s\_cls\_name) | Cluster  name | `string` | `"k8s-cluster"` | no |
| <a name="input_k8s_pods_ipv4_cidr"></a> [k8s\_pods\_ipv4\_cidr](#input\_k8s\_pods\_ipv4\_cidr) | IP for k8s pods addresses | `string` | `"10.112.0.0/16"` | no |
| <a name="input_k8s_subnets"></a> [k8s\_subnets](#input\_k8s\_subnets) | Subnets for k8s | <pre>map(list(object(<br/>    {<br/>      name = string,<br/>      zone = string,<br/>      cidr = list(string)<br/>    }))<br/>  )</pre> | n/a | yes |
| <a name="input_k8s_svcs_ipv4_cidr"></a> [k8s\_svcs\_ipv4\_cidr](#input\_k8s\_svcs\_ipv4\_cidr) | IP for k8s service addresses | `string` | `"10.96.0.0/16"` | no |
| <a name="input_kms_provider_key_name"></a> [kms\_provider\_key\_name](#input\_kms\_provider\_key\_name) | KMS key name | `string` | n/a | yes |
| <a name="input_master_public_ip"></a> [master\_public\_ip](#input\_master\_public\_ip) | Boolean flag. When true, Kubernetes master will have a external ipv4 address. | `bool` | `true` | no |
| <a name="input_master_region"></a> [master\_region](#input\_master\_region) | Region for regional k8s master | `string` | `"ru-central1"` | no |
| <a name="input_master_version"></a> [master\_version](#input\_master\_version) | Version of k8s master in cluster | `string` | n/a | yes |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | Parameters of Kubernetes node groups. | `map` | `{}` | no |
| <a name="input_np_provider"></a> [np\_provider](#input\_np\_provider) | Network policy provider for k8s | `string` | `"CALICO"` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Platform for k8s hosts | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region parameter using in  bucket | `string` | `"ru-central1"` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Service account for k8s cluster | `string` | n/a | yes |
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | Subnet Zones using in project | `list(string)` | `[]` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Net name for k8s | `string` | `"diplom-net"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_k8s_cluster_id"></a> [k8s\_cluster\_id](#output\_k8s\_cluster\_id) | n/a |
| <a name="output_k8s_subnet_master"></a> [k8s\_subnet\_master](#output\_k8s\_subnet\_master) | n/a |
| <a name="output_k8s_subnet_worker"></a> [k8s\_subnet\_worker](#output\_k8s\_subnet\_worker) | n/a |
