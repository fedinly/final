output "bucket_name_out" {
  value = yandex_storage_bucket.fedinly-final-tfstate.bucket_domain_name
  description = "Creates bucket name"
}
output "access_key_out" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  description = "Bucket access key for using in  modules"
  sensitive = true
}
output "private_key_out" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  description = "Bucket secret key for using in  modules"
  sensitive = true
}