# ===========================================
# Example : Azurerm Bastion Host
# ===========================================
module "azurerm_bastion_host_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/bastion_host"

  name                 = "example-bastion"
  resource_group_name  = "example"
  subnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/virtualNetworks/example/subnets/AzureBastionSubnet"
  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/publicIPAddresses/example"

  tags = {
    "project" : "example"
  }
}
