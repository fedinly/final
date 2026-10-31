# Creating a service account
resource "yandex_iam_service_account" "sa-bucket-k8s" {
  name        = var.service_account_name
  description = "Service account for bucket and k8s cluster"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa-bucket-k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
 # The service account gets the "k8s.clusters.agent" role.
  folder_id   = var.folder_id
  role        = "k8s.clusters.agent"
  member      = "serviceAccount:${yandex_iam_service_account.sa-bucket-k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
 # The service account gets the "vpc.publicAdmin" role.
  folder_id   = var.folder_id
  role        = "vpc.publicAdmin"
  member      = "serviceAccount:${yandex_iam_service_account.sa-bucket-k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
 # The service account gets the "container-registry.images.puller" role.
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.sa-bucket-k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "encrypterDecrypter" {
  # The service account gets the "kms.keys.encrypterDecrypter" role.
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.sa-bucket-k8s.id}"
}

resource "yandex_kms_symmetric_key" "kms-key" {
  # Ключ для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
  name              = var.kms_provider_key_name
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}

resource "yandex_kms_symmetric_key_iam_binding" "viewer" {
  symmetric_key_id = yandex_kms_symmetric_key.kms-key.id
  role             = "viewer"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa-bucket-k8s.id}",
  ]
}
