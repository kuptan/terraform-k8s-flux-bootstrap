output "install_manifest" {
  value = var.output_manifests ? data.flux_install.main.content : ""
}

output "sync_manifest" {
  value = var.output_manifests ? data.flux_sync.main.content : ""
}

output "namespace" {
  value = var.namespace
}

output "flux_private_key" {
  sensitive = true
  value     = var.flux_auth_type == "ssh" ? tls_private_key.ssh.0.private_key_pem : ""
}

output "flux_public_key" {
  sensitive = true
  value     = var.flux_auth_type == "ssh" ? tls_private_key.ssh.0.public_key_openssh : ""
}

output "sealed_secrets_generated_private_key" {
  sensitive = true
  value     = var.sealed_secrets.genereate_key_cert ? tls_private_key.sealed_secret_key.0.private_key_pem : ""
}

output "sealed_secrets_generated_cert" {
  sensitive = true
  value     = var.sealed_secrets.genereate_key_cert ? tls_self_signed_cert.sealed_secret_cert.0.cert_pem : ""
}
