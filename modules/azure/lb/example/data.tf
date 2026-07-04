# ===========================================
# Data : Azurerm Resource Group / Public IP
# ===========================================
data "azurerm_resource_group" "example" {
  name = "example-resource-group"
}

data "azurerm_public_ip" "example" {
  name                = "example-pip"
  resource_group_name = data.azurerm_resource_group.example.name
}
