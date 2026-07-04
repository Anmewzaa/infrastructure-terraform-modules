# ===========================================
# Output : Azurerm MSSQL Server
# ===========================================
output "id" {
  value = azurerm_mssql_server.this.id
}
output "name" {
  value = azurerm_mssql_server.this.name
}
output "fully_qualified_domain_name" {
  value = azurerm_mssql_server.this.fully_qualified_domain_name
}
output "identity_principal_id" {
  value = try(azurerm_mssql_server.this.identity[0].principal_id, null)
}
