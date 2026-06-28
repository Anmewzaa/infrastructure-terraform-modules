# ===========================================
# Output : Azurerm Cognitive Account
# ===========================================
output "id" {
  value = azurerm_cognitive_account.this.id
}
output "name" {
  value = azurerm_cognitive_account.this.name
}
output "endpoint" {
  value = azurerm_cognitive_account.this.endpoint
}
output "principal_id" {
  value = try(azurerm_cognitive_account.this.identity[0].principal_id, null)
}
output "primary_access_key" {
  value     = azurerm_cognitive_account.this.primary_access_key
  sensitive = true
}
