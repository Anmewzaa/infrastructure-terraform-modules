# ===========================================
# Example : Azurerm Firewall
# ===========================================
module "azurerm_firewall_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/firewall"

  name                = "example-firewall"
  resource_group_name = data.azurerm_resource_group.example.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configurations = [
    {
      name                 = "example-ip-config"
      subnet_id            = data.azurerm_subnet.firewall.id
      public_ip_address_id = data.azurerm_public_ip.example.id
    }
  ]

  tags = {
    environment = "example"
  }
}
