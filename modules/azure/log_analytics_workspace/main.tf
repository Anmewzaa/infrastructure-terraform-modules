# ===========================================
# Resource : Azurerm Log Analytics Workspace
# ===========================================
resource "azurerm_log_analytics_workspace" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  sku               = var.sku
  retention_in_days = var.retention_in_days
  daily_quota_gb    = var.daily_quota_gb

  allow_resource_only_permissions  = var.allow_resource_only_permissions
  local_authentication_enabled     = var.local_authentication_enabled
  internet_ingestion_enabled       = var.internet_ingestion_enabled
  internet_query_enabled           = var.internet_query_enabled
  cmk_for_query_forced             = var.cmk_for_query_forced

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []
    content {
      type         = identity.value
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], identity.value) ? var.identity_ids : null
    }
  }

  tags = var.tags
}
