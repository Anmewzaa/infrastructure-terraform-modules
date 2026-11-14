# ===========================================
# Output : Azurerm Event Hub Namespace
# ===========================================
output "id" {
  value     = azurerm_eventhub_namespace.this.id
}
output "name" {
  value     = azurerm_eventhub_namespace.this.name
}
output "default_primary_connection_string" {
  value     = azurerm_eventhub_namespace.this.default_primary_connection_string
  sensitive = true
}
