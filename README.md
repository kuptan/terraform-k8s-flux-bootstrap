# Terraform K8s Flux Bootstrap
[![CircleCI](https://circleci.com/gh/kuptan/terraform-k8s-flux-bootstrap/tree/master.svg?style=svg)](https://circleci.com/gh/kuptan/terraform-k8s-flux-bootstrap/tree/master) [![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs) [![GitHub Release](https://img.shields.io/github/release/kube-champ/terraform-k8s-flux-bootstrap.svg?style=flat)]() [![PR's Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com)

A terraform module that will bootstrap a Kubernetes cluster with FluxCD (V2) and Sealed Secrets.

## Module Info
Check the module documentation on the Terraform registry [here](https://registry.terraform.io/modules/kube-champ/flux-bootstrap/k8s/latest). 

Alternatively, can also check [here](./TERRAFORM.md)

## Usage
Below are few examples on how to use this module

#### Simple

```terraform
module "flux-bootstrap" {
  source  = "kube-champ/flux-bootstrap/k8s"
  
  flux_auth_type    = "ssh"
  git_url           = "ssh://git@github.com/kube-champ/fluxcd2-demo.git"
  flux_ssh_scan_url = "github.com"
  flux_target_path  = "clusters"
}
```

#### Custom keys

```terraform
module "flux-bootstrap" {
  source  = "kube-champ/flux-bootstrap/k8s"
  
  ## required vars ...

  flux_ssh_key = {
    auto_generate_key = false
    private_key       = "YOUR_PRIVATE_KEY"
    public_key        = "YOUR_PUBLIC_KEY"
  }

  sealed_secrets_key_cert = {
    auto_generate_key_cert = false
    private_key            = "YOUR_PRIVATE_KEY"
    private_cert           = "YOUR_PRIVATE_CERT"
  }
}
```

#### Override Chart Values

```terraform
module "flux-bootstrap" {
  source  = "kube-champ/flux-bootstrap/k8s"
  
  ## required vars ...

  sealed_secrets_chart_values = [
    file("${path.module}/values/sealed-secrets.yaml")
  ]

  sealed_secrets_chart_values_overrides = {
    "rbac.create" = "true"
    "securityContext.runAsUser" = "1601"
  }

  ## Adds the Flux manifests to the terraform output
  output_manifests = true
}
```

## Contributing
See contributing docs [here](./docs/CONTRIBUTING.md)
