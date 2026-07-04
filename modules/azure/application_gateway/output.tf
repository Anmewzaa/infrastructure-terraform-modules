# ===========================================
# Output : Azurerm Application Gateway
# ===========================================
output "id" {
  value = azurerm_application_gateway.this.id
}

output "name" {
  value = azurerm_application_gateway.this.name
}

output "public_ip_addresses" {
  value = [
    for fic in azurerm_application_gateway.this.frontend_ip_configuration :
    fic.public_ip_address_id if fic.public_ip_address_id != null
  ]
}

output "backend_address_pool_ids" {
  value = { for pool in azurerm_application_gateway.this.backend_address_pool : pool.name => pool.id }
}

output "identity_principal_id" {
  value = try(azurerm_application_gateway.this.identity[0].principal_id, null)
}
