# overall config
variable "harbor_url" {}

# replication registry config
variable "replication_registry_url" {}
variable "replication_registry_access_id" {}
variable "replication_registry_access_secret" {}
variable "replication_registry_insecure" {
  default = true
}

# robot
variable "robot_password_keeper_value" {
  default = 1
}

# auth
variable "config_auth" {
  default = true
}

# email
variable "email_username" {}
variable "email_password" {}
variable "email_host" {}
variable "config_email" {
  default = true
}

locals {
  replication_registry_host = trimsuffix(trimprefix(var.replication_registry_url, "https://"), "/")
  replication_registry_name = split(".", var.replication_registry_url)[1]
}