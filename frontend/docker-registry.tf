resource "yandex_container_registry" "gamion-container-registry" {
  name = "gamion-container-registry"
  folder_id = "b1gnooistjhag9mr5jjd"
  labels = {
    my-label = "container-registry"
  }
}