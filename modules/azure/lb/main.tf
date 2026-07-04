# ===========================================
# Resource : Azurerm Load Balancer
# ===========================================
resource "azurerm_lb" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku      = var.sku
  sku_tier = var.sku_tier

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configurations

    content {
      name                          = frontend_ip_configuration.value.name
      public_ip_address_id          = frontend_ip_configuration.value.public_ip_address_id
      subnet_id                     = frontend_ip_configuration.value.subnet_id
      private_ip_address            = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation = frontend_ip_configuration.value.private_ip_address_allocation
      zones                         = frontend_ip_configuration.value.zones
    }
  }

  tags = var.tags
}
