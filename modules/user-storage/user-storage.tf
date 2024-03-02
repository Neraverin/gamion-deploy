terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
resource "yandex_mdb_postgresql_cluster" "users-storage-pgsql-cluster" {
  name                = "users-storage-pgsql-cluster"
  environment         = "PRESTABLE"
  network_id          = yandex_vpc_network.gamion-net.id
  security_group_ids  = [ yandex_vpc_security_group.users-storage-sg.id ]
  deletion_protection = true

  config {
    version = 16
    resources {
      resource_preset_id = var.resource_preset_id
      disk_type_id       = var.disk_type_id
      disk_size          = var.disk_size
    }
  }

  host {
    zone      = "ru-central1-a"
    name      = "users-storage-host-a"
    subnet_id = yandex_vpc_subnet.gamion-subnet.id
    assign_public_ip = true
  }
}

resource "yandex_mdb_postgresql_database" "users-storage-pgsql-instance1" {
  cluster_id = yandex_mdb_postgresql_cluster.users-storage-pgsql-cluster.id
  name       = "users-storage-pgsql-instance1"
  owner      = "users-db-admin"
}

resource "yandex_mdb_postgresql_user" "users-db-admin" {
  cluster_id = yandex_mdb_postgresql_cluster.users-storage-pgsql-cluster.id
  name       = "users-db-admin"
  password   = var.db_admin_password
}

resource "yandex_vpc_network" "gamion-net" {
  name = "gamion-net"
}

resource "yandex_vpc_subnet" "gamion-subnet" {
  name           = "gamion-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gamion-net.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}

resource "yandex_vpc_security_group" "users-storage-sg" {
  name       = "users-storage-sg"
  network_id = yandex_vpc_network.gamion-net.id

  ingress {
    description    = "PostgreSQL"
    port           = 6432
    protocol       = "TCP"
    v4_cidr_blocks = [ "0.0.0.0/0" ]
  }
}