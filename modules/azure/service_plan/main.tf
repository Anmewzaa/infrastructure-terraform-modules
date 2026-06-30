# ===========================================
# Resource : Azurerm Service Plan
# ===========================================
resource "azurerm_service_plan" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  os_type  = var.os_type
  sku_name = var.sku_name

  app_service_environment_id      = var.app_service_environment_id
  worker_count                     = var.worker_count
  maximum_elastic_worker_count     = var.maximum_elastic_worker_count
  per_site_scaling_enabled         = var.per_site_scaling_enabled
  premium_plan_auto_scale_enabled  = var.premium_plan_auto_scale_enabled
  zone_balancing_enabled           = var.zone_balancing_enabled

  tags = var.tags
}
