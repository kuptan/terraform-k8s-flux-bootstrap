resource "tls_private_key" "sealed_secret_key" {
  count = var.sealed_secrets.generate_key_cert ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "tls_self_signed_cert" "sealed_secret_cert" {
  count = var.sealed_secrets.generate_key_cert ? 1 : 0

  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.sealed_secret_key.0.private_key_pem

  subject {
    common_name  = "sealed-secret"
    organization = "sealed-secret"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "data_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "kubernetes_secret" "sealed_secrets_key" {
  depends_on = [kubernetes_namespace.flux_system]
  count      = var.sealed_secrets.generate_key_cert || (var.sealed_secrets.private_key != "" && var.sealed_secrets.private_cert != "") ? 1 : 0

  metadata {
    name      = "sealed-secret-flux-key"
    namespace = var.namespace
    labels = {
      "sealedsecrets.bitnami.com/sealed-secrets-key" = "active"
    }
  }

  data = {
    "tls.key" = var.sealed_secrets.generate_key_cert ? tls_private_key.sealed_secret_key.0.private_key_pem : var.sealed_secrets.private_key
    "tls.crt" = var.sealed_secrets.generate_key_cert ? tls_self_signed_cert.sealed_secret_cert.0.cert_pem : var.sealed_secrets.private_cert
  }

  type = "kubernetes.io/tls"
}

resource "helm_release" "sealed_secrets" {
  name      = "sealed-secrets"
  namespace = kubernetes_namespace.flux_system.metadata.0.name

  repository = "https://bitnami-labs.github.io/sealed-secrets"
  chart      = "sealed-secrets"
  version    = var.sealed_secrets.chart_version

  set {
    name  = "image.repository"
    value = "quay.io/bitnami/sealed-secrets-controller"
  }

  set {
    name  = "image.tag"
    value = var.sealed_secrets.docker_image_tag
  }
}
