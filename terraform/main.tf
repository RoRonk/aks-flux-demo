# creates resource groups
resource "azurerm_resource_group" "rtae-rg" {
  name     = var.resource_group_name
  location = var.location
}

# creates aks cluster (I don't ave to do it manually)
resource "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = var.k8s_cluster
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.k8s_cluster

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}

# enables extensions on aks (in this case FluxCD. basically installs it)
resource "azurerm_kubernetes_cluster_extension" "flux_extension" {
  name           = var.flux_extenstion_name
  cluster_id     = azurerm_kubernetes_cluster.k8s_cluster.id
  extension_type = "microsoft.flux"
}

# installs FluxCD contorllers, connects git repo for GitOps and let me configure synchronization interval, deploy keys, branch, etc.
resource "azurerm_kubernetes_flux_configuration" "flux_config" {
  name       = var.flux_config_name
  cluster_id = azurerm_kubernetes_cluster.k8s_cluster.id
  namespace  = var.namespace
  scope = "cluster"

  # to what git repo to connect to
  git_repository {
    url             = var.git_repository
    reference_type  = "branch"
    reference_value = var.git_branch
  }

  # lets you customize withputh changing original files
  kustomizations {
    name                     = var.kustomizations_name
    sync_interval_in_seconds = 60
    path                     = "./base"
  }

  # explicit dependency
  depends_on = [
    azurerm_kubernetes_cluster_extension.flux_extension
  ]
}