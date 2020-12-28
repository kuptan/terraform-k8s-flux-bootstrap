# Terraform K8s Flux Bootstrap
This is a terraform module which will bootstrap a Kubernetes cluster with FluxCD (V2)

## Module Info
Check the module documentation [here](https://registry.terraform.io/modules/kube-champ/k8s-infra/azure/latest)

The naming convention of the resources are based on the [Azure Naming Convention](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

## Usage

```terraform
module "k8s-infra" {
  source  = "kube-champ/flux-bootstrap/k8s"
  version = "0.0.1" # <-- change version  
  ...
}
```

## Contributing
See contributing docs [here](./docs/CONTRIBUTING.md)