variable "service_account_name" {
  type = string
  default = "svc-k8s"
}

variable "folder_id" {
  type = string
}

variable "cloud_id" {
  type = string
}

variable "kms_provider_key_name" {
  type = string
  default = "kms-key"
}