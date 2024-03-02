variable "environment" {
    type    = string
    default = ""
}

variable "resource_preset_id" {
    type = string
    default = "s2.micro"
}

variable "disk_size" {
    type = number
    default = 20
}

variable "disk_type_id" {
    type = string
    default = "network-ssd"
}

variable "db_admin_password" {
    type = string
}