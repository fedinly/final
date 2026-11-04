<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_compute_instance.vm-master](https://registry.terraform.io/providers/hashicorp/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_instance.vm-temp](https://registry.terraform.io/providers/hashicorp/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_instance.vm-worker](https://registry.terraform.io/providers/hashicorp/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_image.ubuntu](https://registry.terraform.io/providers/hashicorp/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_each_vm"></a> [each\_vm](#input\_each\_vm) | n/a | <pre>list(object({  <br/>    vm_name=string <br/>    cpu=number<br/>    ram=number<br/>    fraction=number<br/>    disk_volume=number<br/>    disk_type=string<br/>    nat=bool<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_masters_subnet_info"></a> [k8s\_masters\_subnet\_info](#input\_k8s\_masters\_subnet\_info) | From vpc output masters | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_temp_subnet_info"></a> [k8s\_temp\_subnet\_info](#input\_k8s\_temp\_subnet\_info) | From vpc output temp | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_workers_subnet_info"></a> [k8s\_workers\_subnet\_info](#input\_k8s\_workers\_subnet\_info) | From vpc output workers | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
