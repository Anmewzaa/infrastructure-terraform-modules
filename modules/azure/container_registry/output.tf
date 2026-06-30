# ===========================================
# Output : Azurerm Container Registry
# ===========================================
output "id" {
  value = azurerm_container_registry.this.id
}
output "name" {
  value = azurerm_container_registry.this.name
}
output "login_server" {
  value = azurerm_container_registry.this.login_server
}
output "admin_username" {
  value     = azurerm_container_registry.this.admin_username
  sensitive = true
}
output "admin_password" {
  value     = azurerm_container_registry.this.admin_password
  sensitive = true
}
output "identity_principal_id" {
  value = try(azurerm_container_registry.this.identity[0].principal_id, null)
}
