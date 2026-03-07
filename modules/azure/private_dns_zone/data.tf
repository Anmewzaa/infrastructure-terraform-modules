# =========================================== 
# Data : Azurerm Private DNS Zone     
# =========================================== 
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}