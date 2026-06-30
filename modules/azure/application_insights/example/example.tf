# ===========================================
# Example : Azurerm Application Insights
# ===========================================
module "azurerm_application_insights_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/application_insights"

  name                = "example-app-insights"
  resource_group_name = data.azurerm_resource_group.example.name
  application_type    = "web"
  workspace_id        = data.azurerm_log_analytics_workspace.example.id

  retention_in_days = 90

  tags = {
    environment = "example"
  }
}
