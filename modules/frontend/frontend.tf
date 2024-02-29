terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_serverless_container" "gamion-frontend-container" {
   name               = "gamion-frontend-container"
   memory             = var.frontend_memory
   image {
       url = "cr.yandex/crpur8f1eeu1f1lsh9mf/with-docker-multi-env-development:test"
   }
}