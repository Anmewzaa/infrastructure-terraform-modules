# ===========================================
# Output : Azurerm Role Assignment
# ===========================================
output "id" {
  value = azurerm_role_assignment.this.id
}
output "principal_id" {
  value = azurerm_role_assignment.this.principal_id
}
output "role_definition_id" {
  value = azurerm_role_assignment.this.role_definition_id
}
