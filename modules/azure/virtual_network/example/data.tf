# =========================================== 
# Data : Azurerm Virtual Network       
# =========================================== 
# resource group name
data "azurerm_resource_group" "example" {
  name = "example"
}
# network security group
data "azurerm_network_security_group" "example" {
  name = "example"
  resource_group_name = data.azurerm_resource_group.example.name
}
# route table
data "azurerm_route_table" "example" {
  name = "example"
  resource_group_name = data.azurerm_resource_group.example.name
}