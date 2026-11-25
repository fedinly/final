variable "network_id" {
  type    = string
  default = ""
}
variable "k8s_workers_subnet_info" {
  type = list(object({
    subnet_id = string
    zone      = string
  }))
  description = "From vpc output workers"
  default     = []
}
variable "k8s_masters_subnet_info" {
  type = list(object({
    subnet_id = string
    zone      = string
  }))
  description = "From vpc output masters"
  default     = []
}
variable "sg_internal" {
  type = string
}
variable "sg_k8s_worker" {
  type = string
}
variable "sg_k8s_master" {
  type = string
}
#variable "sg_k8s_master_each" {
#  type = string
#}
variable "subnet_zones" {
  type    = list(string)
  default = []
}
variable "service_account_id" {
  type    = string
  default = ""
}
variable "k8s_cls_name" {
  type = string
}
variable "kms_provider_key_name" {
  description = "KMS key name"
  type        = string
  default     = null
}
variable "folder_id" {
  type = string
}
variable "np_provider" {
  type    = string
  default = "CALICO"
}
variable "scale_policy" {
  type    = string
  default = "s-c2-m8"
}
variable "k8s_scale" {
  description = "Параметры масштабирования node group k8s"
  type = object({
    min   = number
    max   = number
    start = number
  })
  default = {
    min   = 3
    max   = 6
    start = 3
  }
}
variable "env_name_k8s" {
  type        = string
  description = "Specified cluster name"
}
variable "platform" {
  type        = string
  description = "Specified a platform for nodes"
}
variable "pl_group_name" {
  type        = string
  default     = "pg01"
  description = "Placement group name"
}
variable "node_groups" {
  description = "Parameters of Kubernetes node groups."
  default     = {}
}
variable "master_public_ip" {
  type        = bool
  default     = true
  description = "Is cluster have or not external IP"
}
variable "master_region" {
  type        = string
  default     = "ru-central1"
  description = "Zone placement for master"
}
variable "master_version" {
  type        = string
  description = "Specified version for master"
}
variable "sa-k8s-clusters-agent" {
  default     = {}
  description = "Assigned role cluster agent"
}
variable "sa-vpc-public-admin" {
  default     = {}
  description = "Assigned role to manage VPC for SA"
}
variable "sa-images-puller" {
  default     = {}
  description = "Assigned role to pull images for SA"
}
variable "sa-encrypterDecrypter" {
  default     = {}
  description = "Assigned role to manage KMS for SA"
}
variable "sa-k8s-cluster-api" {
  default     = {}
  description = "Assigned role to  manage cluster for SA"
}
variable "kms-key-id" {
  default     = {}
  description = "Assigned KMS key with SA"
}
