# =========================================== 
# Example : Azurerm Virtual Network       
# =========================================== 
module "azurerm_virtual_network_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/virtual_network"

  name                = "example"
  resource_group_name = "example"
  address_space       = ["192.168.0.0/24"]

  subnets = [
    {
      name             = "sbnet-01"
      address_prefixes = ["192.168.0.0/25"] # 192.168.0.0 - 192.168.0.127
    },
    {
      name             = "sbnet-02"
      address_prefixes = ["192.168.0.128/25	"] # 192.168.0.128 - 192.168.0.255
    }
  ]

  tags     = {
    "project" : "example"
  }
}