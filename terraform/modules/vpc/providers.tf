terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.198.0"
    }
  }
  required_version = ">=1.12.0"

  backend "s3" {
    shared_credentials_files = [ "../bucket/backend.hcl" ]
    #shared_config_files      = [ "./backend.hcl" ]
    profile                  = "default"

    
    bucket  = ""
    region  = ""
    key     = "vpc/terraform.tfstate"
    encrypt = false
    
    # Встроенный механизм блокировок (Terraform >= 1.6)
    # Не требует отдельной базы данных!
    use_lockfile = true
    
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
      #dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/etnts0te4jp2tnfp9hfj"
    }
    
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    #dynamodb_table = "fedinly-netology-tfstate-lock"
  }
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) 
}
