output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.k8s_cluster.name
  description = "The name of the AKS cluster"
}

output "aks_cluster_endpoint" {
  value       = azurerm_kubernetes_cluster.k8s_cluster.kube_config[0].host
  sensitive   = true
  description = "The API server endpoint for the AKS cluster"
}

output "aks_cluster_resource_group" {
  value       = azurerm_kubernetes_cluster.k8s_cluster.resource_group_name
  description = "The resource group of the AKS cluster"
}

output "kubeconfig" {
  value       = azurerm_kubernetes_cluster.k8s_cluster.kube_config_raw
  description = "Raw kubeconfig to connect to AKS"
  sensitive   = true
}