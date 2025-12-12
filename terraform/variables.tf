variable "subscription_id" {
  type        = string
  default     = "c067469d-b66c-42b7-b993-f5476b8b694a"
  description = "The Azure subscription id"
}

variable "resource_group_name" {
  type        = string
  default     = "rtae-flux-rg"
  description = "Name of azure research group"
}

variable "location" {
  type        = string
  default     = "Sweden Central"
  description = "Location of the reasearch group"
}

variable "k8s_cluster" {
  type        = string
  default     = "rtae-aks-dev"
  description = "Name and DNS prefix for the cluster"
}

variable "flux_extenstion_name" {
  type        = string
  default     = "rtae-flux-ext"
  description = "Name of flux extension"
}

variable "flux_config_name" {
  type        = string
  default     = "rtae-flux-config"
  description = "Name of flux configuration"
}

variable "git_repository" {
  type        = string
  default     = "https://github.com/RoRonk/aks-flux-demo.git"
  description = "Link to git repository"
}

variable "node_count" {
  type        = number
  default     = 1
  description = "Number of nodes in the default node pool"
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2_v3"
  description = "VM size for the AKS nodes"
}

variable "namespace" {
  type        = string
  default     = "flux"
  description = "Namespace for FluxCD controllers"
}

variable "git_branch" {
  type        = string
  default     = "main"
  description = "Branch of the Git repository FluxCD should track"
}

variable "sync_interval" {
  type        = string
  default     = "1m"
  description = "How often FluxCD checks the Git repository for changes"
}

variable "kustomizations_name" {
  type        = string
  default     = "config-kustomizations"
  description = "Name for the kustomization in FluxCD"
}

variable "deploy_key_secret_ref" {
  type        = string
  default     = ""
  description = "Secret reference for an SSH deploy key for private Git repositories"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to assign to Azure resources"
}
