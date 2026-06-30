# ===========================================
# Output : Azurerm Linux Web App
# ===========================================
output "id" {
  value = azurerm_linux_web_app.this.id
}
output "name" {
  value = azurerm_linux_web_app.this.name
}
output "default_hostname" {
  value = azurerm_linux_web_app.this.default_hostname
}
output "outbound_ip_addresses" {
  value = azurerm_linux_web_app.this.outbound_ip_addresses
}
output "identity_principal_id" {
  value = try(azurerm_linux_web_app.this.identity[0].principal_id, null)
}
