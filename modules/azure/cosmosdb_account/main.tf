# ===========================================
# Resource : Azurerm Cosmos DB Account
# ===========================================
resource "azurerm_cosmosdb_account" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  offer_type = "Standard"
  kind       = var.kind

  automatic_failover_enabled      = var.automatic_failover_enabled
  multiple_write_locations_enabled = var.multiple_write_locations_enabled
  public_network_access_enabled   = var.public_network_access_enabled

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.consistency_level == "BoundedStaleness" ? var.max_interval_in_seconds : null
    max_staleness_prefix    = var.consistency_level == "BoundedStaleness" ? var.max_staleness_prefix : null
  }

  dynamic "geo_location" {
    for_each = var.geo_locations
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
    }
  }

  dynamic "capabilities" {
    for_each = var.capabilities
    content {
      name = capabilities.value
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []
    content {
      type         = identity.value
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], identity.value) ? var.identity_ids : null
    }
  }

  tags = var.tags
}
