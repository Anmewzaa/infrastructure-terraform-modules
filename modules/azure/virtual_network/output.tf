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