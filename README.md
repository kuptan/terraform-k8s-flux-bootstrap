# Terraform K8s Flux Bootstrap
This is a terraform module which will bootstrap a Kubernetes cluster with FluxCD (V2)

## Module Info
Check the module documentation [here](https://registry.terraform.io/modules/kube-champ/flux-bootstrap/k8s/latest)

## Usage

```terraform
module "flux-bootstrap" {
  source  = "kube-champ/flux-bootstrap/k8s"
  version = "0.0.x" # <-- change version  
  ...
}
```

## Contributing
See contributing docs [here](./docs/CONTRIBUTING.md)
