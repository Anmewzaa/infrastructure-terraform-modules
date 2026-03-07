# =========================================== 
# Data : Azurerm Network Security Group    
# =========================================== 
# resource group name
data "azurerm_resource_group" "example" {
  name = "example"
}