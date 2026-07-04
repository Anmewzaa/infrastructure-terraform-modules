# ===========================================
# Output : Azurerm Load Balancer
# ===========================================
output "id" {
  value = azurerm_lb.this.id
}
output "name" {
  value = azurerm_lb.this.name
}
output "private_ip_address" {
  value = azurerm_lb.this.private_ip_address
}
output "private_ip_addresses" {
  value = azurerm_lb.this.private_ip_addresses
}
