# =========================================== 
# Output : Azurerm Virtual Network     
# =========================================== 
output "id" {
  value = azurerm_virtual_network.this.id
}
output "name" {
  value = azurerm_virtual_network.this.name
}
output "subnet" {
  value = azurerm_virtual_network.this.subnet
}
output "address_space" {
  value = azurerm_virtual_network.this.address_space
}
output "location" {
  value = azurerm_virtual_network.this.location
}
output "resource_group_name" {
  value = azurerm_virtual_network.this.resource_group_name
}
output "tags" {
  value = azurerm_virtual_network.this.tags
}