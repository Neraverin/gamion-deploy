terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
  zone      = local.zone
}

locals {
  cloud_id  = "b1gkir5f99u0n7ubtu4o"
  folder_id = "b1gnooistjhag9mr5jjd"
  zone      = "ru-central1-a"
}