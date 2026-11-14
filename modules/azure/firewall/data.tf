# ===========================================
# Data : Azurerm Firewall
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
