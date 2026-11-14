# ===========================================
# Resource : Azurerm Redis Cache
# ===========================================
resource "azurerm_redis_cache" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  redis_version       = var.redis_version
  minimum_tls_version = var.minimum_tls_version

  non_ssl_port_enabled          = var.non_ssl_port_enabled
  public_network_access_enabled = var.public_network_access_enabled
  subnet_id                     = var.subnet_id
  shard_count                   = var.shard_count
  zones                         = var.zones

  redis_configuration {
    maxmemory_policy       = var.maxmemory_policy
    authentication_enabled = var.authentication_enabled
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []

    content {
      type         = identity.value
      identity_ids = strcontains(identity.value, "UserAssigned") ? var.identity_ids : null
    }
  }

  tags = var.tags
}
