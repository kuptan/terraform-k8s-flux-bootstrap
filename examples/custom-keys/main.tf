provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path      = "~/.kube/config"
  # config_context   = "demo-cluster-admin"
}

module "k8s-flux" {
  # source = "kube-champ/flux-bootstrap/k8s"
  source = "../../"

  git_url           = "ssh://git@github.com/kube-champ/fluxcd2-demo.git"
  flux_ssh_scan_url = "github.com"
  flux_target_path  = "./clusters"

  flux_ssh_key = {
    auto_generate_key = false
    private_key       = file("${path.module}/keys/flux-key.pem")
    public_key        = file("${path.module}/keys/flux-key.pub")
  }

  sealed_secrets_key_cert = {
    auto_generate_key_cert = false
    private_key            = file("${path.module}/keys/sealed-secrets-key.pem")
    private_cert           = file("${path.module}/keys/sealed-secrets-cert.crt")
  }
}
