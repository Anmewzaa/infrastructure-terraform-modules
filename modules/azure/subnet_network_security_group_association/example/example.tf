# ===========================================
# Example : Azurerm Subnet Network Security Group Association
# ===========================================
module "azurerm_subnet_network_security_group_association_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/subnet_network_security_group_association"

  subnet_id                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/virtualNetworks/example/subnets/example"
  network_security_group_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/networkSecurityGroups/example"
}
