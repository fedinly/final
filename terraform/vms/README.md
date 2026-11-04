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
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_image.ubuntu](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Boot disk size | `number` | `15` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | Boot disk type | `string` | `"network-hdd"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description on VM | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | worker or master | `string` | `""` | no |
| <a name="input_k8s_masters_subnet_info"></a> [k8s\_masters\_subnet\_info](#input\_k8s\_masters\_subnet\_info) | From vpc output masters subnet | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_k8s_workers_subnet_info"></a> [k8s\_workers\_subnet\_info](#input\_k8s\_workers\_subnet\_info) | From vpc output workers subnet | <pre>list(object({<br/>    subnet_id = string<br/>    zone = string<br/>  }))</pre> | `[]` | no |
| <a name="input_nat"></a> [nat](#input\_nat) | Existance of public IP on VM | `bool` | `false` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | Cloud network ID for VMs | `string` | `""` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | VM platform. | `string` | `"standard-v3"` | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Preemptible setting on VM | `bool` | `true` | no |
| <a name="input_sec
