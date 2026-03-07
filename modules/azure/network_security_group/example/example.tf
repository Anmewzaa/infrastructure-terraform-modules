# =========================================== 
# Example : Azurerm Network Security Group  
# =========================================== 
module "azurerm_network_security_group_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/network_security_group"

  name                = "example"
  resource_group_name = "example"

  security_rules = [
    {
      name                       = "allow-all"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  tags     = {
    "project" : "example"
  }
}