# =========================================== 
# Resource : Azurerm Virtual Network     
# =========================================== 
resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  address_space       = var.address_space

  dynamic "subnet" {
    for_each = var.subnets

    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      security_group   = subnet.value.security_group
      route_table_id   = subnet.value.route_table_id
    }
  }

  tags = var.tags

  depends_on = [ 
    azurerm_resource_group.this 
  ]
}