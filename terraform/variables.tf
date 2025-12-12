variable "subscription_id" {
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
  description = "Azure subscription id"
}

variable "resource_group_name" {
  type        = string
  default     = "rg-placeholder"
  description = "Name of azure research group"
}

variable "location" {
  type        = string
  default     = "Sweden Central"
  description = "Location of the reasearch group"
}

variable "k8s_cluster" {
  type        = string
  default     = "k8s-placeholder"
  description = "Name and DNS prefix for the cluster"
}

variable "namespace" {
  type        = string
  default     = "ns-placeholder"
  description = "Namespace for resources"
}

variable "flux_extenstion_name" {
  type        = string
  default     = "flux-ext-placeholder"
  description = "Name of flux extension"
}

variable "flux_config_name" {
  type        = string
  default     = "flux-config_placeholder"
  description = "Name of flux configuration"
}

variable "git_repository" {
  type        = string
  default     = "https://github.com/name/repo-placeholder.git"
  description = "Link to git repository"
}

variable "git_branch" {
  type        = string
  default     = "branch-placeholder"
  description = "Branch of the Git repository FluxCD should track"
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
