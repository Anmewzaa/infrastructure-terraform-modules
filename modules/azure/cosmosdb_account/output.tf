# ===========================================
# Output : Azurerm Cosmos DB Account
# ===========================================
output "id" {
  value = azurerm_cosmosdb_account.this.id
}
output "name" {
  value = azurerm_cosmosdb_account.this.name
}
output "endpoint" {
  value = azurerm_cosmosdb_account.this.endpoint
}
output "primary_key" {
  value     = azurerm_cosmosdb_account.this.primary_key
  sensitive = true
}
output "secondary_key" {
  value     = azurerm_cosmosdb_account.this.secondary_key
  sensitive = true
}
output "identity_principal_id" {
  value = try(azurerm_cosmosdb_account.this.identity[0].principal_id, null)
}
