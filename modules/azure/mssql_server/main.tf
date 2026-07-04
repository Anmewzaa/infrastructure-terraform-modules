# ===========================================
# Resource : Azurerm MSSQL Server
# ===========================================
resource "azurerm_mssql_server" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  version             = var.server_version

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator != null ? [var.azuread_administrator] : []
    content {
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      azuread_authentication_only = lookup(azuread_administrator.value, "azuread_authentication_only", false)
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
