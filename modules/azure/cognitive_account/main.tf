# ===========================================
# Resource : Azurerm Cognitive Account
# ===========================================
resource "azurerm_cognitive_account" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  kind                = var.kind
  sku_name            = var.sku_name

  custom_subdomain_name          = var.custom_subdomain_name
  public_network_access_enabled  = var.public_network_access_enabled

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []

    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []

    content {
      default_action = network_acls.value.default_action
      ip_rules        = network_acls.value.ip_rules

      dynamic "virtual_network_rules" {
        for_each = network_acls.value.virtual_network_subnet_ids

        content {
          subnet_id = virtual_network_rules.value
        }
      }
    }
  }

  tags = var.tags
}
