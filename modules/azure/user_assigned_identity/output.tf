# =========================================== 
# Output : Azurerm User Assigned Identity
# =========================================== 
output "id" {
  value = azurerm_user_assigned_identity.this.id
}
output "name" {
  value = azurerm_user_assigned_identity.this.name
}