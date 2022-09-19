resource "harbor_registry" "harbor-replication-registry" {
  provider_name = "harbor"
  name          = local.replication_registry_name
  endpoint_url  = var.replication_registry_url
  access_id     = var.replication_registry_access_id
  access_secret = var.replication_registry_access_secret
  insecure      = var.replication_registry_insecure
}

resource "harbor_replication" "push-replication" {
  name                   = "push-replication-to-${local.replication_registry_name}"
  action                 = "push"
  registry_id            = harbor_registry.harbor-replication-registry.registry_id
  schedule               = "event_based"
  deletion               = true
  override               = true
}