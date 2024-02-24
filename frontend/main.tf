resource "yandex_serverless_container" "gamion-frontend-container" {
   name               = "gamion-frontend-container"
   memory             = 512
   image {
       url = "cr.yandex/crpur8f1eeu1f1lsh9mf/with-docker-multi-env-development:test"
   }
}