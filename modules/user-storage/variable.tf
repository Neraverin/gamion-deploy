variable "environment" {
    type    = string
    default = ""
}

variable "rcu_limit" {
    type = number
    default = 10
}

variable "storage_size_limit" {
    type = number
    default = 50
}

variable "throttling_rcu_limit" {
    type = number
    default = 0
}