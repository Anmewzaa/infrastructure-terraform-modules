# ===========================================
# Output : Azurerm Key Vault Secret
# ===========================================
output "id" {
  value     = azurerm_key_vault_secret.this.id
}
output "name" {
  value     = azurerm_key_vault_secret.this.name
}
output "version" {
  value     = azurerm_key_vault_secret.this.version
}
output "versionless_id" {
  value     = azurerm_key_vault_secret.this.versionless_id
}
