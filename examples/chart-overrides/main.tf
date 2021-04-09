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

  sealed_secrets_chart_values = [
    file("${path.module}/values/sealed-secrets.yaml")
  ]

  sealed_secrets_chart_values_overrides = {
    "rbac.create" = "true"
  }
}
