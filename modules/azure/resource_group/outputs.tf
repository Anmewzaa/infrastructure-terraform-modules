# =========================================== 
# Output : Azurerm Resource Group       
# =========================================== 
output "id" {
  value = azurerm_resource_group.this.id
}
output "location" {
  value = azurerm_resource_group.this.location
}
output "managed_by" {
  value = azurerm_resource_group.this.managed_by
}
output "name" {
  value = azurerm_resource_group.this.name
}