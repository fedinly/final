###bucert vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
/*
variable "sa_id" {
  type = string
}
*/
###bucket
variable "bucket_name" {
  type = string
  description = "Bucket for Diploma"
  default = "fedinly-final-tfstate"
}
variable "bucket_class" {
  type = string
  description = "Mandatory for class of bucket"
  default = "standard"
}
