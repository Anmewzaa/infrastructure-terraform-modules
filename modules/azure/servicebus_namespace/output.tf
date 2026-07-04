# ===========================================
# Output : Azurerm Service Bus Namespace
# ===========================================
output "id" {
  value = azurerm_servicebus_namespace.this.id
}
output "name" {
  value = azurerm_servicebus_namespace.this.name
}
output "endpoint" {
  value = azurerm_servicebus_namespace.this.endpoint
}
output "default_primary_connection_string" {
  value     = azurerm_servicebus_namespace.this.default_primary_connection_string
  sensitive = true
}
output "default_primary_key" {
  value     = azurerm_servicebus_namespace.this.default_primary_key
  sensitive = true
}
output "identity_principal_id" {
  value = try(azurerm_servicebus_namespace.this.identity[0].principal_id, null)
}
