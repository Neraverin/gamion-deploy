terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_ydb_database_serverless" "database1" {
  name                = "test-ydb-serverless"
  deletion_protection = "true"

  serverless_database {
    enable_throttling_rcu_limit = false
    provisioned_rcu_limit       = var.rcu_limit
    storage_size_limit          = var.storage_size_limit
    throttling_rcu_limit        = var.throttling_rcu_limit
  }
}