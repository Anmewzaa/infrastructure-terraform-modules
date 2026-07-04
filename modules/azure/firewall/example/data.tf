# ===========================================
# Data : Azurerm Resource Group / Subnet / Public IP
# ===========================================
data "azurerm_resource_group" "example" {
  name = "example-resource-group"
}

data "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  virtual_network_name = "example-vnet"
  resource_group_name  = data.azurerm_resource_group.example.name
}

data "azurerm_public_ip" "example" {
  name                = "example-pip"
  resource_group_name = data.azurerm_resource_group.example.name
}
