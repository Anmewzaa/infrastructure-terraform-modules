# ===========================================
# Example : Azurerm Monitor Metric Alert
# ===========================================
module "azurerm_monitor_metric_alert_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/monitor_metric_alert"

  name                = "example-metric-alert"
  resource_group_name = data.azurerm_resource_group.example.name
  scopes              = []

  criteria = [
    {
      metric_namespace = "Microsoft.Compute/virtualMachines"
      metric_name      = "Percentage CPU"
      aggregation      = "Average"
      operator         = "GreaterThan"
      threshold        = 80
    }
  ]

  actions = [
    {
      action_group_id = data.azurerm_monitor_action_group.example.id
    }
  ]

  severity    = 3
  frequency   = "PT1M"
  window_size = "PT5M"

  tags = {
    environment = "example"
  }
}
