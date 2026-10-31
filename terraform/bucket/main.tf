# Creating a static access key
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = data.terraform_remote_state.iam.outputs.sa_id
  description        = "Static access key for object storage"
}

# Creating a bucket using a static key
resource "yandex_storage_bucket" "fedinly-final-tfstate" {
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket                = var.bucket_name
  max_size              = 1048576
  default_storage_class = var.bucket_class
  #acl                   = "private"
  versioning {
    enabled = true
  }
  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }
}

resource "local_file" "backend_provision" {
  depends_on = [ yandex_storage_bucket.fedinly-final-tfstate ]
  content =  <<-EOT
  %{if length(yandex_storage_bucket.fedinly-final-tfstate) > 0}
  bucket             = "${yandex_storage_bucket.fedinly-final-tfstate.bucket}"
  region             = "ru-central-1"
  access_key         = "${yandex_iam_service_account_static_access_key.sa-static-key.access_key}"
  secret_key         = "${yandex_iam_service_account_static_access_key.sa-static-key.secret_key}"
  %{endif}
  EOT
  filename = "${abspath(path.module)}/backend.hcl"
}
resource "null_resource" "creds_chmod" {
  depends_on = [ yandex_storage_bucket.fedinly-final-tfstate ]
  provisioner "local-exec" {
    command = "chmod 0600 ${abspath(path.module)}/backend.hcl"
  }
}