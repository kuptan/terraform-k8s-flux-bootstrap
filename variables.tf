variable "git_url" {
  description = "The URL of the git repository."
  type        = string
}

variable "flux_target_path" {
  description = "The path of the directory in the Git repository on which Flux will sync."
  type        = string
}

variable "namespace" {
  description = "The namespace on which Flux will be installed."
  type        = string

  default = "flux-system"
}

variable "namespace_labels" {
  description = "kubernetes labels to be applied on the flux namespace."
  type        = map(string)

  default = {}
}

variable "git_branch" {
  description = "The Git branch to be watched."
  type        = string

  default = "master"
}

variable "sync_interval" {
  description = "Sync interval in minutes."
  type        = number

  default = 1
}

variable "flux_version" {
  description = "The version of flux to install."
  type        = string

  default = "latest"
}

variable "flux_network_policy_enabled" {
  description = "A flag to enable/disable network policies"
  type        = bool

  default = false
}

variable "components" {
  description = "Toolkit components to include in the install manifests"
  type        = list(string)

  default = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
}

variable "registry" {
  description = "Container registry where the toolkit images are published"
  type        = string

  default = "ghcr.io/fluxcd"
}

variable "image_pull_secrets" {
  description = "Kubernetes secret name used for pulling the toolkit images from a private registry"
  type        = string

  default = ""
}

variable "log_level" {
  description = "Log level for toolkit components"
  type        = string

  default = "info"
}

variable "flux_auth_type" {
  description = "The authentication method Flux will use to access th git repo. Options `ssh` and `basic`. Default to `ssh`"
  type        = string

  default = "ssh"
}

variable "flux_ssh_key" {
  description = "Flux SSH key config. Only when `flux_auth_type` is seto to `ssh`."
  type = object({
    auto_generate_key : bool,
    private_key : string,
    public_key : string,
  })

  default = {
    auto_generate_key = true
    private_key       = ""
    public_key        = ""
  }
}

variable "flux_basic_auth" {
  description = "The basic auth credentials. Only needed when flux_auth_type is basic"
  sensitive   = true
  type        = object({ username : string, password : string })

  default = {
    username = ""
    password = ""
  }
}

variable "flux_ssh_scan_url" {
  description = "The domain that will be used by the ssh-keyscan. Only required when flux_auth_type is ssh"
  type        = string

  default = ""
}

variable "sealed_secrets_key_cert" {
  description = "The key/cert config for sealed secrets. If `auto_generate_key_cert` is false and no custom key/cert is provided, no custom key/cert will be generated"
  type = object({
    auto_generate_key_cert : bool,
    private_key : string
    private_cert : string
  })

  default = {
    auto_generate_key_cert = true
    private_key            = ""
    private_cert           = ""
  }
}

variable "sealed_secrets_chart" {
  description = "The chart version and docker image version."
  type = object({
    repository : string
    chart_version : string
    docker_image_tag : string
  })

  default = {
    repository       = "https://bitnami-labs.github.io/sealed-secrets"
    chart_version    = "1.15.0-r3"
    docker_image_tag = "v0.15.0"
  }
}

variable "sealed_secrets_chart_values" {
  description = "A list of values.yaml files to be added to the chart installation."
  type        = list(string)

  default = []
}

variable "sealed_secrets_chart_values_overrides" {
  description = "A map of key/value to override the chart values. The key must be the path/name of the chart value, e.g: `path.to.chart.key`"
  type        = map(string)

  default = {}
}

variable "output_manifests" {
  description = "A flag whether to add the manifests genereated by Flux in the terraform output."
  type        = bool

  default = false
}