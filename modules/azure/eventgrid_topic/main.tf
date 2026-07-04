# ===========================================
# Resource : Azurerm Eventgrid Topic
# ===========================================
resource "azurerm_eventgrid_topic" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  input_schema                  = var.input_schema
  public_network_access_enabled = var.public_network_access_enabled
  local_auth_enabled            = var.local_auth_enabled

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []

    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }

  tags = var.tags
}
