# ===========================================
# Resource : Azurerm Cosmos DB Account
# ===========================================
locals {
  geo_locations = length(var.geo_locations) > 0 ? var.geo_locations : [
    {
      location          = data.azurerm_resource_group.this.location
      failover_priority = 0
      zone_redundant    = false
    }
  ]
}

resource "azurerm_cosmosdb_account" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  offer_type = var.offer_type
  kind       = var.kind

  automatic_failover_enabled    = var.automatic_failover_enabled
  free_tier_enabled             = var.free_tier_enabled
  local_authentication_disabled = var.local_authentication_disabled
  public_network_access_enabled = var.public_network_access_enabled
  ip_range_filter               = toset(var.ip_range_filter)

  is_virtual_network_filter_enabled = length(var.virtual_network_subnet_ids) > 0

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.consistency_level == "BoundedStaleness" ? var.max_interval_in_seconds : null
    max_staleness_prefix    = var.consistency_level == "BoundedStaleness" ? var.max_staleness_prefix : null
  }

  dynamic "geo_location" {
    for_each = local.geo_locations

    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = geo_location.value.zone_redundant
    }
  }

  dynamic "capabilities" {
    for_each = toset(var.capabilities)

    content {
      name = capabilities.value
    }
  }

  dynamic "virtual_network_rule" {
    for_each = toset(var.virtual_network_subnet_ids)

    content {
      id = virtual_network_rule.value
    }
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
