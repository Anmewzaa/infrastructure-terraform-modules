# ===========================================
# Output : Azurerm Load Balancer
# ===========================================
output "id" {
  value     = azurerm_lb.this.id
}
output "name" {
  value     = azurerm_lb.this.name
}
output "frontend_ip_configuration" {
  value     = azurerm_lb.this.frontend_ip_configuration
}
output "backend_address_pool_ids" {
  value     = { for k, v in azurerm_lb_backend_address_pool.this : k => v.id }
}
output "probe_ids" {
  value     = { for k, v in azurerm_lb_probe.this : k => v.id }
}
output "rule_ids" {
  value     = { for k, v in azurerm_lb_rule.this : k => v.id }
}
