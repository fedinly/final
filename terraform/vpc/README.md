<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.12.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.198.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.198.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_vpc_address.public_addr](https://registry.terraform.io/providers/yandex-cloud/yandex/0.198.0/docs/resources/vpc_address) | resource |
| [yandex_vpc_network.k8s_net](https://registry.terraform.io/providers/yandex-cloud/yandex/0.198.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_security_group.internal](https://registry.terraform.io/providers/yandex-cloud/yandex/0.198.0/docs/resources/vpc_security_group) | resource |
| [yandex_vpc_security_group.k8s_master](https://registry.terraform.io/providers/yandex-cloud/yandex/0.198.0/docs/resources/vpc_security_group) | resource |
| [yandex_vpc_security_group.k8s_worker](https://registry.terraform.io/providers/yandex-cloud/yandex/0.198.0/docs/resources/vpc_security_group) | resource |
| [yandex_vpc_subnet.k8s_subn](https://registry.terraform.io/providers/yandex-cloud/yandex/0.198.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | bucket info | `string` | n/a | yes |
| <a name="input_cidr_blocks_priv"></a> [cidr\_blocks\_priv](#input\_cidr\_blocks\_priv) | CIDR blocks for private net | `list(string)` | n/a | yes |
| <a name="input_cidr_blocks_pub"></a> [cidr\_blocks\_pub](#input\_cidr\_blocks\_pub) | CIDR blocks for public net | `list(string)` | n/a | yes |
| <a name="input_external_static_ips"></a> [external\_static\_ips](#input\_external\_static\_ips) | VM Static IP's | <pre>map(list(object(<br/>    {<br/>      name = string,<br/>      zone = string<br/>    }))<br/>  )</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for bucket | `string` | `"ru-central1"` | no |
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | Avaliable subnet zones to use | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnet parameters for using in VM | <pre>map(list(object(<br/>    {<br/>      name = string,<br/>      zone = string,<br/>      cidr = list(string)<br/>    }))<br/>  )</pre> | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VM network name | `string` | `"k8s_net"` | no |
| <a name="input_white_ips_for_master"></a> [white\_ips\_for\_master](#input\_white\_ips\_for\_master) | IP's where allow to connect to VMs | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_k8s_masters_subnet_info"></a> [k8s\_masters\_subnet\_info](#output\_k8s\_masters\_subnet\_info) | Subnet parameters for Master VMs |
| <a name="output_k8s_workers_subnet_info"></a> [k8s\_workers\_subnet\_info](#output\_k8s\_workers\_subnet\_info) | Subnet parameters for Worker VMs |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | Network ID, for using in vm module |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Network name to use in vm module |
| <a name="output_sg_internal"></a> [sg\_internal](#output\_sg\_internal) | Secrity group parameters internal net |
| <a name="output_sg_k8s_master"></a> [sg\_k8s\_master](#output\_sg\_k8s\_master) | Secrity group parameters masters net |
| <a name="output_sg_k8s_worker"></a> [sg\_k8s\_worker](#output\_sg\_k8s\_worker) | Secrity group parameters workers net |
| <a name="output_subnet_pub_details"></a> [subnet\_pub\_details](#output\_subnet\_pub\_details) | Using if need public net |
<!-- END_TF_DOCS -->
