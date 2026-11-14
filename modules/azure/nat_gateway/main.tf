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

# Index-based keys keep for_each plan-safe when IDs are not yet known.
resource "azurerm_nat_gateway_public_ip_association" "this" {
  for_each = { for i, id in var.public_ip_ids : tostring(i) => id }

  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = each.value
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  for_each = { for i, id in var.subnet_ids : tostring(i) => id }

  subnet_id      = each.value
  nat_gateway_id = azurerm_nat_gateway.this.id
}
