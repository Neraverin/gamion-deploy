terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_container_registry" "gamion-container-registry" {
  name = "gamion-container-registry"
  folder_id = var.Folder_id
  labels = {
    my-label = "container-registry"
  }
}