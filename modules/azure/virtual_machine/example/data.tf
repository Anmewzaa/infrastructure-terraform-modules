# ===========================================
# Data : Azurerm Virtual Machine
# ===========================================
# resource group name
data "azurerm_resource_group" "example" {
  name = "example"
}
data "azurerm_subnet" "example" {
  name                 = "example-subnet"
  virtual_network_name = "example-vnet"
  resource_group_name  = data.azurerm_resource_group.example.name
}
