# ===========================================
# Data : Azurerm PostgreSQL Flexible Server
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
