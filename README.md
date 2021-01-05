# Terraform K8s Flux Bootstrap
[![CircleCI](https://circleci.com/gh/kube-champ/terraform-k8s-flux-bootstrap/tree/master.svg?style=shield)](https://circleci.com/gh/kube-champ/terraform-k8s-flux-bootstrap/tree/master) [![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs) [![GitHub Release](https://img.shields.io/github/release/kube-champ/terraform-k8s-flux-bootstrap.svg?style=flat)]() [![PR's Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com)

This is a terraform module which will bootstrap a Kubernetes cluster with FluxCD (V2)

## Module Info
Check the module documentation [here](https://registry.terraform.io/modules/kube-champ/flux-bootstrap/k8s/latest)

## Usage

```terraform
module "flux-bootstrap" {
  source  = "kube-champ/flux-bootstrap/k8s"
  ...
}
```

## Contributing
See contributing docs [here](./docs/CONTRIBUTING.md)
