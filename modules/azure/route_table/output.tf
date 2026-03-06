# =========================================== 
# Output : Azurerm Route Table    
# =========================================== 
output "id" {
  value = azurerm_route_table.this.id
}
output "name" {
  value = azurerm_route_table.this.name
}
output "route" {
  value = azurerm_route_table.this.route
}