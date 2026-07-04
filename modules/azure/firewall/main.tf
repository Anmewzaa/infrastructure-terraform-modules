# ===========================================
# Resource : Azurerm Firewall
# ===========================================
resource "azurerm_firewall" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku_name           = var.sku_name
  sku_tier           = var.sku_tier
  firewall_policy_id = var.firewall_policy_id
  dns_servers        = var.dns_servers
  threat_intel_mode  = var.threat_intel_mode

  dynamic "ip_configuration" {
    for_each = var.ip_configurations

    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = ip_configuration.value.public_ip_address_id
    }
  }

  tags = var.tags
}
