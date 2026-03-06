# =========================================== 
# Resource : Azurerm Route Table 
# =========================================== 
resource "azurerm_route_table" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  dynamic "route" {
    for_each = var.routes

    content {
      name           = route.value.name
      address_prefix = route.value.address_prefix
      next_hop_type  = route.value.next_hop_type
    }
  }

  tags = var.tags
}