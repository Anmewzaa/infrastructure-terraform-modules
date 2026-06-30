# ===========================================
# Data : Azurerm Resource Group / Log Analytics Workspace
# ===========================================
data "azurerm_resource_group" "example" {
  name = "example-resource-group"
}

data "azurerm_log_analytics_workspace" "example" {
  name                = "example-log-workspace"
  resource_group_name = data.azurerm_resource_group.example.name
}
