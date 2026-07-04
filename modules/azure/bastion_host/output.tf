# ===========================================
# Output : Azurerm Bastion Host
# ===========================================
output "id" {
  value = azurerm_bastion_host.this.id
}
output "name" {
  value = azurerm_bastion_host.this.name
}
output "dns_name" {
  value = azurerm_bastion_host.this.dns_name
}
