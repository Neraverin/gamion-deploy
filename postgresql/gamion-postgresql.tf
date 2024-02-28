resource "yandex_mdb_postgresql_cluster" "gamion-postgresql-cluster" {
  name                = "gamion-postgresql-cluster"
  environment         = "PRESTABLE"
  network_id          = yandex_vpc_network.gamion-network.id
  security_group_ids  = [ yandex_vpc_security_group.gamion-postgresql-sg.id ]
  deletion_protection = true

  config {
    version = 16
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = "20"
    }
  }

  host {
    zone      = "ru-central1-a"
    name      = "gamion-postgresql-host-a"
    subnet_id = yandex_vpc_subnet.gamion-subnet.id
  }
}

resource "yandex_mdb_postgresql_database" "gamion-postgresql-db" {
  cluster_id = yandex_mdb_postgresql_cluster.gamion-postgresql-cluster.id
  name       = "gamion-postgresql-db"
  owner      = "gamion-users-user"
}

resource "yandex_mdb_postgresql_user" "gamion-users-user" {
  cluster_id = yandex_mdb_postgresql_cluster.gamion-postgresql-cluster.id
  name       = "gamion-users-user"
  password   = "user1user1"
}

resource "yandex_vpc_network" "gamion-network" {
  name = "gamion-network"
}

resource "yandex_vpc_subnet" "gamion-subnet" {
  name           = "gamion-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.gamion-network.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}

resource "yandex_vpc_security_group" "gamion-postgresql-sg" {
  name       = "gamion-postgresql-sg"
  network_id = yandex_vpc_network.gamion-network.id

  ingress {
    description    = "PostgreSQL"
    port           = 6432
    protocol       = "TCP"
    v4_cidr_blocks = [ "0.0.0.0/0" ]
  }
}
