resource "harbor_config_system" "config" {
  project_creation_restriction = "adminonly"
  robot_token_expiration       = 30
  robot_name_prefix            = "robot$"
}

resource "harbor_config_email" "email" {
  count          = var.config_email? 1 : 0
  email_host     = var.email_host
  email_port     = 25
  email_from     = "no-reply@${local.replication_registry_host}"
  email_username = var.email_username
  email_password = var.email_password
}

resource "harbor_config_auth" "auth" {
  count                 = var.config_auth? 1 : 0
  auth_mode             = "ldap_auth"
  //TODO: fill this out
}

resource "harbor_garbage_collection" "gc" {
  schedule        = "Daily"
  delete_untagged = true
}

resource "harbor_interrogation_services" "interrogation-services" {
  vulnerability_scan_policy = "daily"
}