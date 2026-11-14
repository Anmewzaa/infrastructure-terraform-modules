# ===========================================
# Example : Azurerm Load Balancer
# ===========================================
module "azurerm_lb_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/lb"

  name                = "example-lb"
  resource_group_name = "example"

  frontend_ip_configurations = [
    {
      name                 = "public"
      public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/publicIPAddresses/example"
    }
  ]
  backend_pool_names = ["backend"]
  probes = [
    { name = "http", protocol = "Tcp", port = 80 }
  ]
  rules = [
    {
      name                           = "http"
      protocol                       = "Tcp"
      frontend_port                  = 80
      backend_port                   = 80
      frontend_ip_configuration_name = "public"
      backend_pool_name              = "backend"
      probe_name                     = "http"
    }
  ]

  tags = {
    "project" : "example"
  }
}
