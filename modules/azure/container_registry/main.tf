# ===========================================
# Resource : Azurerm Container Registry
# ===========================================
resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  sku           = var.sku
  admin_enabled = var.admin_enabled

  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option

  quarantine_policy_enabled = var.quarantine_policy_enabled
  retention_policy_in_days  = var.retention_policy_in_days
  trust_policy_enabled      = var.trust_policy_enabled
  zone_redundancy_enabled   = var.zone_redundancy_enabled
  export_policy_enabled     = var.export_policy_enabled
  data_endpoint_enabled     = var.data_endpoint_enabled

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []
    content {
      type         = identity.value
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], identity.value) ? var.identity_ids : null
    }
  }

  dynamic "georeplications" {
    for_each = var.georeplications
    content {
      location                  = georeplications.value.location
      regional_endpoint_enabled = lookup(georeplications.value, "regional_endpoint_enabled", null)
      zone_redundancy_enabled   = lookup(georeplications.value, "zone_redundancy_enabled", null)
      tags                      = lookup(georeplications.value, "tags", null)
    }
  }

  tags = var.tags
}
