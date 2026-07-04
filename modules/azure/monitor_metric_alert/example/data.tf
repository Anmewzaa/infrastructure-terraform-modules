# ===========================================
# Data : Azurerm Monitor Metric Alert
# ===========================================
data "azurerm_resource_group" "example" {
  name = "example-resource-group"
}

data "azurerm_monitor_action_group" "example" {
  name                = "example-action-group"
  resource_group_name = "example-resource-group"
}
