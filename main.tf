terraform {
  required_providers {
    harbor = {
      source  = "goharbor/harbor"
      version = "3.8.4"
    }
  }
}

provider "harbor" {
  alias    = "primary"
  url      = var.primary_harbor_url
  username = var.primary_harbor_username
  password = var.primary_harbor_password
}

provider "harbor" {
  alias    = "secondary"
  url      = var.secondary_harbor_url
  username = var.secondary_harbor_username
  password = var.secondary_harbor_password
}

module "primary" {
  source    = "./harbor"
  providers = {
    harbor = harbor.primary
  }
  harbor_url                         = var.primary_harbor_url
  email_host                         = var.email_host
  email_username                     = var.email_username
  email_password                     = var.email_password
  replication_registry_access_id     = module.secondary.replication_robot_name
  replication_registry_access_secret = module.secondary.replication_robot_secret
  replication_registry_url           = var.secondary_harbor_url
  config_auth                        = var.config_auth
  config_email                       = var.config_email
  robot_password_keeper_value        = var.robot_password_keeper_value
}

module "secondary" {
  source    = "./harbor"
  providers = {
    harbor = harbor.secondary
  }
  harbor_url                         = var.secondary_harbor_url
  email_host                         = var.email_host
  email_username                     = var.email_username
  email_password                     = var.email_password
  replication_registry_access_id     = module.primary.replication_robot_name
  replication_registry_access_secret = module.primary.replication_robot_secret
  replication_registry_url           = var.primary_harbor_url
  config_auth                        = var.config_auth
  config_email                       = var.config_email
  robot_password_keeper_value        = var.robot_password_keeper_value
}