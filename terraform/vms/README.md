<!-- BEGIN_TF_DOCS -->
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
| [yandex_compute_instance.vm-master](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_instance.vm-worker](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_image.ubuntu](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_each_vm_master"></a> [each\_vm\_master](#input\_each\_vm\_master) | VM master parameters | <pre>list(object({  <br/>    vm_name=string <br/>    cpu=number<br/>    ram=number<br/>    fraction=number<br/>    disk_volume=number<br/>    disk_type=string<br/>    nat=bool<br/>  }))</pre> | `[]` | no |
| <a name="input_each_vm_worker"></a> [each\_vm\_worker](#input\_each\_vm\_worker) | VM worker parameters | <pre>list(object({  <br/>    vm_name=string <br/>    cpu=number<br/>    ram=number<br/>    fraction=number<br/>    disk_volume=number<br/>    disk_type=string<br/>    nat=bool<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_masters_subnet_info"></a> [k8s\_masters\_subnet\_info](#input\_k8s\_masters\_subnet\_info) | From vpc output masters subnet | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_workers_subnet_info"></a> [k8s\_workers\_subnet\_info](#input\_k8s\_workers\_subnet\_info) | From vpc output workers subnet | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | Cloud network ID for VMs | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->