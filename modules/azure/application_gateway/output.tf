# ===========================================
# Output : Azurerm Application Gateway
# ===========================================
output "id" {
  value     = azurerm_application_gateway.this.id
}
output "name" {
  value     = azurerm_application_gateway.this.name
}
output "backend_address_pool_ids" {
  value     = { for p in azurerm_application_gateway.this.backend_address_pool : p.name => p.id }
}
