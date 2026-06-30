# ===========================================
# Example : Azurerm Log Analytics Workspace
# ===========================================
module "azurerm_log_analytics_workspace_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/log_analytics_workspace"

  name                = "example-log-workspace"
  resource_group_name = data.azurerm_resource_group.example.name

  sku               = "PerGB2018"
  retention_in_days = 90

  tags = {
    environment = "example"
  }
}
