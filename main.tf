
## https://registry.terraform.io/providers/fluxcd/flux/latest/docs/data-sources/sync

data "flux_install" "main" {
  target_path        = var.flux_target_path
  arch               = var.flux_arch
  network_policy     = var.flux_network_policy_enabled
  version            = var.flux_version
  namespace          = var.namespace
  registry           = var.registry
  image_pull_secrets = var.image_pull_secrets
  components         = toset(var.components)
  log_level          = var.log_level
}

data "flux_sync" "main" {
  target_path = var.flux_target_path
  url         = var.git_url
  branch      = var.git_branch
  interval    = var.sync_interval
  namespace   = var.namespace
}

data "kubectl_file_documents" "install" {
  content = data.flux_install.main.content
}

data "kubectl_file_documents" "sync" {
  content = data.flux_sync.main.content
}

resource "kubernetes_namespace" "flux_system" {
  metadata {
    name = var.namespace
  }

  lifecycle {
    ignore_changes = [
      metadata[0].labels,
    ]
  }
}

resource "kubectl_manifest" "apply" {
  for_each   = { for v in data.kubectl_file_documents.install.documents : sha1(v) => v }
  depends_on = [kubernetes_namespace.flux_system]

  yaml_body = each.value
}

# Apply manifests on the cluster
resource "kubectl_manifest" "sync" {
  for_each = { for v in data.kubectl_file_documents.sync.documents : sha1(v) => v }
  depends_on = [
    kubectl_manifest.apply,
    kubernetes_namespace.flux_system
  ]

  yaml_body = each.value
}
