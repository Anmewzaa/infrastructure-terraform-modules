# ===========================================
# Data : Azurerm MSSQL Server
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
