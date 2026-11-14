# ===========================================
# Example : Azurerm NAT Gateway
# ===========================================
module "azurerm_nat_gateway_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/nat_gateway"

  name                = "example-nat"
  resource_group_name = "example"

  public_ip_ids = [] # e.g. [module.public_ip.id]
  subnet_ids    = [] # e.g. [azurerm_subnet.example.id]

  tags = {
    "project" : "example"
  }
}
