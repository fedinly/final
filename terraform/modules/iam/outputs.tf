output "svc_id" {
  value = yandex_iam_service_account.svc-k8s.id
  description = "SVC ID"
}