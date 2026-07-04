# ===========================================
# Resource : Azurerm Public IP
# ===========================================
resource "azurerm_public_ip" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  allocation_method       = var.allocation_method
  sku                     = var.sku
  ip_version              = var.ip_version
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  domain_name_label       = var.domain_name_label
  zones                   = var.zones

  tags = var.tags
}
