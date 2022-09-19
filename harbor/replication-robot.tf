resource "random_password" "replication-robot-password" {
  length      = 16
  lower       = true
  upper       = true
  min_lower   = 1
  min_upper   = 1
  min_special = 1
  min_numeric = 1
  special     = true
  keepers     = {
    rotate_value = var.robot_password_keeper_value
  }
}

resource "harbor_robot_account" "replication-system-robot" {
  name        = local.replication_registry_host
  description = "system level robot account used by other instance to enable bi-direction replication"
  level       = "system"
  secret      = resource.random_password.replication-robot-password.result
  permissions {
    access {
      action   = "list"
      resource = "repository"
    }
    access {
      action   = "pull"
      resource = "repository"
    }
    access {
      action   = "push"
      resource = "repository"
    }
    access {
      action   = "delete"
      resource = "repository"
    }
    access {
      action   = "read"
      resource = "artifact"
    }
    access {
      action   = "list"
      resource = "artifact"
    }
    access {
      action   = "delete"
      resource = "artifact"
    }
    access {
      action   = "create"
      resource = "artifact-label"
    }
    access {
      action   = "delete"
      resource = "artifact-label"
    }
    access {
      action   = "create"
      resource = "tag"
    }
    access {
      action   = "delete"
      resource = "tag"
    }
    access {
      action   = "list"
      resource = "tag"
    }
    access {
      action   = "create"
      resource = "scan"
    }
    access {
      action   = "stop"
      resource = "scan"
    }
    access {
      action   = "read"
      resource = "helm-chart"
    }
    access {
      action   = "create"
      resource = "helm-chart-version"
    }
    access {
      action   = "delete"
      resource = "helm-chart-version"
    }
    access {
      action   = "create"
      resource = "helm-chart-version-label"
    }
    access {
      action   = "delete"
      resource = "helm-chart-version-label"
    }
    kind      = "project"
    namespace = "*"
  }
}