# ===========================================
# Resource : Azurerm Application Insights
# ===========================================
resource "azurerm_application_insights" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  application_type = var.application_type
  workspace_id     = var.workspace_id

  retention_in_days                  = var.retention_in_days
  daily_data_cap_in_gb               = var.daily_data_cap_in_gb
  daily_data_cap_notifications_enabled = var.daily_data_cap_notifications_enabled
  sampling_percentage                = var.sampling_percentage
  ip_masking_enabled                 = var.ip_masking_enabled
  local_authentication_enabled       = var.local_authentication_enabled
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled

  tags = var.tags
}
