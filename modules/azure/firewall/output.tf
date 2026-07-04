# ===========================================
# Output : Azurerm Firewall
# ===========================================
output "id" {
  value = azurerm_firewall.this.id
}
output "name" {
  value = azurerm_firewall.this.name
}
output "ip_configuration_private_ip_address" {
  value = try(azurerm_firewall.this.ip_configuration[0].private_ip_address, null)
}
