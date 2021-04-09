## Requirements

| Name | Version |
|------|---------|
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

## Modules

No Modules.

## Resources

| Name |
|------|
| [flux_install](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/data-sources/install) |
| [flux_sync](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/data-sources/sync) |
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubectl_file_documents](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) |
| [kubectl_manifest](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |
| [kubernetes_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) |
| [local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) |
| [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) |
| [tls_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) |
| [tls_self_signed_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| flux\_target\_path | The path of the directory in the Git repository on which Flux will sync. | `string` | n/a | yes |
| git\_url | The URL of the git repository. | `string` | n/a | yes |
| components | Toolkit components to include in the install manifests | `list(string)` | <pre>[<br>  "source-controller",<br>  "kustomize-controller",<br>  "helm-controller",<br>  "notification-controller"<br>]</pre> | no |
| flux\_auth\_type | The authentication method Flux will use to access th git repo. Options `ssh` and `basic`. Default to `ssh` | `string` | `"ssh"` | no |
| flux\_basic\_auth | The basic auth credentials. Only needed when flux\_auth\_type is basic | `object({ username : string, password : string })` | <pre>{<br>  "password": "",<br>  "username": ""<br>}</pre> | no |
| flux\_network\_policy\_enabled | A flag to enable/disable network policies | `bool` | `false` | no |
| flux\_ssh\_key | Flux SSH key config. Only when `flux_auth_type` is seto to `ssh`. | <pre>object({<br>    auto_generate_key : bool,<br>    private_key : string,<br>    public_key : string,<br>  })</pre> | <pre>{<br>  "auto_generate_key": true,<br>  "private_key": "",<br>  "public_key": ""<br>}</pre> | no |
| flux\_ssh\_scan\_url | The domain that will be used by the ssh-keyscan. Only required when flux\_auth\_type is ssh | `string` | `""` | no |
| flux\_version | The version of flux to install. | `string` | `"latest"` | no |
| git\_branch | The Git branch to be watched. | `string` | `"master"` | no |
| image\_pull\_secrets | Kubernetes secret name used for pulling the toolkit images from a private registry | `string` | `""` | no |
| log\_level | Log level for toolkit components | `string` | `"info"` | no |
| namespace | The namespace on which Flux will be installed. | `string` | `"flux-system"` | no |
| namespace\_labels | kubernetes labels to be applied on the flux namespace. | `map(string)` | `{}` | no |
| output\_manifests | A flag whether to add the manifests genereated by Flux in the terraform output. | `bool` | `false` | no |
| registry | Container registry where the toolkit images are published | `string` | `"ghcr.io/fluxcd"` | no |
| sealed\_secrets\_chart | The chart version and docker image version. | <pre>object({<br>    repository : string<br>    chart_version : string<br>    docker_image_tag : string<br>  })</pre> | <pre>{<br>  "chart_version": "1.15.0-r3",<br>  "docker_image_tag": "v0.15.0",<br>  "repository": "https://bitnami-labs.github.io/sealed-secrets"<br>}</pre> | no |
| sealed\_secrets\_chart\_values | A list of values.yaml files to be added to the chart installation. | `list(string)` | `[]` | no |
| sealed\_secrets\_chart\_values\_overrides | A map of key/value to override the chart values. The key must be the path/name of the chart value, e.g: `path.to.chart.key` | `map(string)` | `{}` | no |
| sealed\_secrets\_key\_cert | The key/cert config for sealed secrets. If `auto_generate_key_cert` is false and no custom key/cert is provided, no custom key/cert will be generated | <pre>object({<br>    auto_generate_key_cert : bool,<br>    private_key : string<br>    private_cert : string<br>  })</pre> | <pre>{<br>  "auto_generate_key_cert": true,<br>  "private_cert": "",<br>  "private_key": ""<br>}</pre> | no |
| sync\_interval | Sync interval in minutes. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| flux\_generated\_private\_key | n/a |
| flux\_generated\_public\_key | n/a |
| install\_manifest | n/a |
| namespace | n/a |
| sealed\_secrets\_generated\_cert | n/a |
| sealed\_secrets\_generated\_private\_key | n/a |
| sync\_manifest | n/a |
