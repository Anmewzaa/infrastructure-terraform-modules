# ===========================================
# Output : Azurerm Virtual Machine
# ===========================================
output "id" {
  value = var.os_type == "Linux" ? azurerm_linux_virtual_machine.this[0].id : azurerm_windows_virtual_machine.this[0].id
}
output "name" {
  value = var.os_type == "Linux" ? azurerm_linux_virtual_machine.this[0].name : azurerm_windows_virtual_machine.this[0].name
}
output "network_interface_id" {
  value = azurerm_network_interface.this.id
}
output "private_ip_address" {
  value = azurerm_network_interface.this.private_ip_address
}
output "principal_id" {
  value = var.os_type == "Linux" ? try(azurerm_linux_virtual_machine.this[0].identity[0].principal_id, null) : try(azurerm_windows_virtual_machine.this[0].identity[0].principal_id, null)
}
