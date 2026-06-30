# ===========================================
# Output : Azurerm Service Plan
# ===========================================
output "id" {
  value = azurerm_service_plan.this.id
}
output "name" {
  value = azurerm_service_plan.this.name
}
output "kind" {
  value = azurerm_service_plan.this.kind
}
