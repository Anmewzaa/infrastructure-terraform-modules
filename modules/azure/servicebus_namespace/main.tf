# ===========================================
# Resource : Azurerm Service Bus Namespace
# ===========================================
resource "azurerm_servicebus_namespace" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku                          = var.sku
  capacity                     = var.capacity
  premium_messaging_partitions = var.premium_messaging_partitions

  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []

    content {
      type         = identity.value
      identity_ids = strcontains(identity.value, "UserAssigned") ? var.identity_ids : null
    }
  }

  tags = var.tags
}
