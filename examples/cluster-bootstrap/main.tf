provider "helm" {
  kubernetes {
    config_path = "~/.kube/aks-demo-cluster"
  }
}

provider "kubernetes" {
  config_path      = "~/.kube/aks-demo-cluster"
  config_context   = "demo-cluster-admin"
}

module "k8s-flux" {
  source = "kube-champ/flux-bootstrap/k8s"

  flux_ssh_scan_url = var.flux_ssh_scan_url
  git_url           = var.git_url
  flux_target_path  = var.flux_target_path
}
