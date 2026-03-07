# =========================================== 
# Example : Azurerm Network Security Group  
# =========================================== 
module "azurerm_network_security_group_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/route_table"

  name                = "example"
  resource_group_name = "example"

  routes = [
    # {
    #   name           = "example"
    #   address_prefix = "10.1.0.0/16"
    #   next_hop_type  = "VnetLocal"
    # }
  ]

  tags     = {
    "project" : "example"
  }
}