# ===========================================
# Data : Azurerm Eventhub Namespace
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
