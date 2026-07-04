# ===========================================
# Resource : Azurerm Event Hub Namespace
# ===========================================
resource "azurerm_eventhub_namespace" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  sku                 = var.sku

  capacity                      = var.capacity
  auto_inflate_enabled          = var.auto_inflate_enabled
  maximum_throughput_units      = var.auto_inflate_enabled ? var.maximum_throughput_units : null
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}
