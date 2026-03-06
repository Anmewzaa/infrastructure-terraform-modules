# =========================================== 
# Output : Azurerm Network Security Group     
# =========================================== 
output "id" {
  value = azurerm_network_security_group.this.id
}
output "name" {
  value = azurerm_network_security_group.this.name
}
output "security_rule" {
  value = azurerm_network_security_group.this.security_rule
}