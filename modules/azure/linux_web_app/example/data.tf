# ===========================================
# Data : Azurerm Resource Group / Service Plan
# ===========================================
data "azurerm_resource_group" "example" {
  name = "example-resource-group"
}

data "azurerm_service_plan" "example" {
  name                = "example-service-plan"
  resource_group_name = data.azurerm_resource_group.example.name
}
