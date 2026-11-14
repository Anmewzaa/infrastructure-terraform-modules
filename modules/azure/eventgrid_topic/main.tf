# ===========================================
# Resource : Azurerm Event Grid Topic
# ===========================================
resource "azurerm_eventgrid_topic" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  input_schema                  = var.input_schema
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []

    content {
      type         = identity.value
      identity_ids = strcontains(identity.value, "UserAssigned") ? var.identity_ids : null
    }
  }

  tags = var.tags
}
