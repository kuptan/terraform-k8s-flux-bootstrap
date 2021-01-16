variable "git_url" {
  description = "The URL of the git repository"
  type        = string
}

variable "flux_target_path" {
  description = "The path of the directory in the Git repository on which Flux will sync"
  type        = string
}

variable "namespace" {
  description = "The namespace on which Flux will be installed"
  type        = string

  default = "flux-system"
}

variable "git_branch" {
  description = "The Git branch to be watched"
  type        = string

  default = "master"
}

variable "sync_interval" {
  description = "Sync interval in minutes"
  type        = number

  default = 1
}

variable "flux_version" {
  description = "The version of flux to install"
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
  description = "Kubernetes secret name used for pulling the toolkit images from a private registryvalue"
  type        = string

  default = ""
}

variable "log_level" {
  description = "Log level for toolkit components"
  type        = string

  default = "info"
}

variable "flux_auth_type" {
  description = "The authentication method that flux will use to access th Git repo (ssh, basic)"
  type        = string

  default = "ssh"
}

variable "flux_ssh_keys" {
  description = "The ssh keys for flux. (Active when flux_auth_type is ssh)"
  type = object({
    generate_key : bool,
    private_key : string,
    public_key : string,
  })

  default = {
    generate_key = true
    private_key  = ""
    public_key   = ""
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

variable "sealed_secrets" {
  description = "The sealed secret default chart version and docker image tag. (if generate_key_cert is false and private_key and private_cert are not provided, no custom key will be generated)"
  type = object({
    generate_key_cert : bool,
    private_key : string,
    private_cert : string,
    chart_version : string,
    docker_image_tag : string
  })

  default = {
    generate_key_cert = true
    private_key       = ""
    private_cert      = ""
    chart_version     = "1.13.2"
    docker_image_tag  = "v0.13.1"
  }
}

variable "output_manifests" {
  description = "A flag whether to include the manifests genereated by Flux in the output"
  type        = bool

  default = false
}