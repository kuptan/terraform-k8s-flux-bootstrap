provider "kubernetes" {
  config_path = "~/.kube/aks-cluster-demo"
  config_context = "demo-cluster-admin"
}

module "k8s-flux" {
  source  = "kube-champ/flux-bootstrap/k8s"
  version = "0.0.1" # <-- change version  
  
  flux_ssh_scan_url = var.flux_ssh_scan_url
  git_url = var.git_url
  flux_target_path = var.flux_target_path
}