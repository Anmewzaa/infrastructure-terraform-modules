# ===========================================
# Example : Azurerm Subnet Route Table Association
# ===========================================
module "azurerm_subnet_route_table_association_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/subnet_route_table_association"

  subnet_id      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/virtualNetworks/example/subnets/example"
  route_table_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/routeTables/example"
}
