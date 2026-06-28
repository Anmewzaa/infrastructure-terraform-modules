# ===========================================
# Data : Azurerm Role Assignment
# ===========================================
# resource group name
data "azurerm_resource_group" "example" {
  name = "example"
}
data "azurerm_client_config" "current" {}
