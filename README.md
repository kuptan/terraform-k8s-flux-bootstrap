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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| flux | >= 0.0.8 |
| kubectl | >= 1.7.0 |
| kubernetes | >= 1.13.3 |

## Providers

| Name | Version |
|------|---------|
| flux | >= 0.0.8 |
| helm | n/a |
| kubectl | >= 1.7.0 |
| kubernetes | >= 1.13.3 |
| local | n/a |
| null | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| components | Toolkit components to include in the install manifests | `list(string)` | <pre>[<br>  "source-controller",<br>  "kustomize-controller",<br>  "helm-controller",<br>  "notification-controller"<br>]</pre> | no |
| flux\_arch | The arch of Flux (amd64, arm) | `string` | `"amd64"` | no |
| flux\_auth\_type | The authentication method that flux will use to access th Git repo (ssh, basic) | `string` | `"ssh"` | no |
| flux\_basic\_auth | The basic auth credentials. Only needed when flux\_auth\_type is basic | `object({ username : string, password : string })` | <pre>{<br>  "password": "",<br>  "username": ""<br>}</pre> | no |
| flux\_network\_policy\_enabled | A flag to enable/disable network policies | `bool` | `false` | no |
| flux\_ssh\_scan\_url | The domain that will be used by the ssh-keyscan. Only required when flux\_auth\_type is ssh | `string` | `""` | no |
| flux\_target\_path | The path of the directory in the Git repository on which Flux will sync | `string` | n/a | yes |
| flux\_version | The version of flux to install | `string` | `"latest"` | no |
| git\_branch | The Git branch to be watched | `string` | `"master"` | no |
| git\_url | The URL of the git repository | `string` | n/a | yes |
| image\_pull\_secrets | Kubernetes secret name used for pulling the toolkit images from a private registryvalue | `string` | `""` | no |
| log\_level | Log level for toolkit components | `string` | `"info"` | no |
| namespace | The namespace on which Flux will be installed | `string` | `"flux-system"` | no |
| output\_manifests | A flag whether to include the manifests genereated by Flux in the output | `bool` | `false` | no |
| registry | Container registry where the toolkit images are published | `string` | `"ghcr.io/fluxcd"` | no |
| sealed\_secrets | The sealed secret default chart version and docker image tag. (if genereate\_key\_cert is false and private\_key and private\_cert are not provided, no custom key will be generated) | <pre>object({<br>    genereate_key_cert : bool,<br>    private_key : string,<br>    private_cert : string,<br>    chart_version : string,<br>    docker_image_tag : string<br>  })</pre> | <pre>{<br>  "chart_version": "1.12.2",<br>  "docker_image_tag": "v0.13.1",<br>  "genereate_key_cert": true,<br>  "private_cert": "",<br>  "private_key": ""<br>}</pre> | no |
| sync\_interval | Sync interval in minutes | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| flux\_private\_key | n/a |
| flux\_public\_key | n/a |
| install\_manifest | n/a |
| namespace | n/a |
| sealed\_secrets\_generated\_cert | n/a |
| sealed\_secrets\_generated\_private\_key | n/a |
| sync\_manifest | n/a |

