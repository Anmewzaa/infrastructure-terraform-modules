# ===========================================
# Example : Azurerm NAT Gateway
# ===========================================
module "azurerm_nat_gateway_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/nat_gateway"

  name                    = "example-nat-gw"
  resource_group_name     = data.azurerm_resource_group.example.name
  idle_timeout_in_minutes = 4

  tags = {
    environment = "example"
  }
}
