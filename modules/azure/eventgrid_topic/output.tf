# ===========================================
# Output : Azurerm Event Grid Topic
# ===========================================
output "id" {
  value     = azurerm_eventgrid_topic.this.id
}
output "name" {
  value     = azurerm_eventgrid_topic.this.name
}
output "endpoint" {
  value     = azurerm_eventgrid_topic.this.endpoint
}
output "primary_access_key" {
  value     = azurerm_eventgrid_topic.this.primary_access_key
  sensitive = true
}
