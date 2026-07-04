# ===========================================
# Output : Azurerm Event Grid Topic
# ===========================================
output "id" {
  value = azurerm_eventgrid_topic.this.id
}
output "name" {
  value = azurerm_eventgrid_topic.this.name
}
output "endpoint" {
  value = azurerm_eventgrid_topic.this.endpoint
}
output "primary_access_key" {
  value     = azurerm_eventgrid_topic.this.primary_access_key
  sensitive = true
}
output "secondary_access_key" {
  value     = azurerm_eventgrid_topic.this.secondary_access_key
  sensitive = true
}
output "identity_principal_id" {
  value = try(azurerm_eventgrid_topic.this.identity[0].principal_id, null)
}
