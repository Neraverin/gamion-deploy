variable "TOKEN" {
  type = string
}

variable "PG_USER_PASSWORD" {
  type = string
}

variable "env" {
    type    = string
    default = "production"
}

variable "YANDEX_TOKEN" {}
variable "YC_FOLDER_ID" {}
variable "YC_CLOUD_ID" {}