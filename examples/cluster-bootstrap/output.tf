output "flux_generated_public_key" {
  sensitive = true
  value     = module.k8s-flux.flux_generated_public_key
}

output "sealed_secrets_generated_cert" {
  sensitive = true
  value     = module.k8s-flux.sealed_secrets_generated_cert
}
