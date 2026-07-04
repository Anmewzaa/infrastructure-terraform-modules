# ===========================================
# Example : Azurerm Load Balancer
# ===========================================
module "azurerm_lb_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/lb"

  name                = "example-lb"
  resource_group_name = data.azurerm_resource_group.example.name
  sku                 = "Standard"

  frontend_ip_configurations = [
    {
      name                 = "example-frontend"
      public_ip_address_id = data.azurerm_public_ip.example.id
    }
  ]

  tags = {
    environment = "example"
  }
}
