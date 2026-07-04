# ===========================================
# Resource : Azurerm NAT Gateway
# ===========================================
resource "azurerm_nat_gateway" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku_name                = var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones

  tags = var.tags
}
