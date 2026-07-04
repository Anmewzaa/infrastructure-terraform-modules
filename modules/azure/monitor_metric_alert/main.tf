# ===========================================
# Resource : Azurerm Monitor Metric Alert
# ===========================================
resource "azurerm_monitor_metric_alert" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  scopes              = var.scopes

  description = var.description
  enabled     = var.enabled
  severity    = var.severity
  frequency   = var.frequency
  window_size = var.window_size

  dynamic "criteria" {
    for_each = var.criteria

    content {
      metric_namespace = criteria.value.metric_namespace
      metric_name      = criteria.value.metric_name
      aggregation      = criteria.value.aggregation
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold
    }
  }

  dynamic "action" {
    for_each = var.actions

    content {
      action_group_id    = action.value.action_group_id
      webhook_properties = action.value.webhook_properties
    }
  }

  tags = var.tags
}
