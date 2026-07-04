# ===========================================
# Resource : Azurerm Bastion Host
# ===========================================
resource "azurerm_bastion_host" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku                = var.sku
  copy_paste_enabled = var.copy_paste_enabled
  scale_units        = var.scale_units

  dynamic "ip_configuration" {
    for_each = var.ip_configuration != null ? [var.ip_configuration] : []

    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = ip_configuration.value.public_ip_address_id
    }
  }

  tags = var.tags
}
