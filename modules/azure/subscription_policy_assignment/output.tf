# ===========================================
# Output : Azurerm Subscription Policy Assignment
# ===========================================
output "id" {
  value = azurerm_subscription_policy_assignment.this.id
}
output "name" {
  value = azurerm_subscription_policy_assignment.this.name
}
output "identity_principal_id" {
  value = try(azurerm_subscription_policy_assignment.this.identity[0].principal_id, null)
}
