# ===========================================
# Data : Azurerm Cognitive Account
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
