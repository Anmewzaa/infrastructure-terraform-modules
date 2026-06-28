# ===========================================
# Output : Azurerm Kubernetes Cluster
# ===========================================
output "id" {
  value = azurerm_kubernetes_cluster.this.id
}
output "name" {
  value = azurerm_kubernetes_cluster.this.name
}
output "fqdn" {
  value = azurerm_kubernetes_cluster.this.fqdn
}
output "node_resource_group" {
  value = azurerm_kubernetes_cluster.this.node_resource_group
}
output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.this.oidc_issuer_url
}
output "identity_principal_id" {
  value = try(azurerm_kubernetes_cluster.this.identity[0].principal_id, null)
}
output "kubelet_identity_object_id" {
  value = try(azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id, null)
}
output "kube_config_raw" {
  value     = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive = true
}
