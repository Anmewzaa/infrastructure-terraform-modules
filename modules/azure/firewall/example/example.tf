# ===========================================
# Example : Azurerm Firewall
# ===========================================
module "azurerm_firewall_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/firewall"

  name                = "example-fw"
  resource_group_name = "example"

  ip_configurations = [
    {
      name                 = "primary"
      subnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/virtualNetworks/example/subnets/AzureFirewallSubnet"
      public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/publicIPAddresses/example"
    }
  ]

  tags = {
    "project" : "example"
  }
}
