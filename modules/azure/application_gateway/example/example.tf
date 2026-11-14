# ===========================================
# Example : Azurerm Application Gateway
# ===========================================
module "azurerm_application_gateway_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/application_gateway"

  name                 = "example-agw"
  resource_group_name  = "example"
  subnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/virtualNetworks/example/subnets/agw"
  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/publicIPAddresses/example"

  frontend_ports        = [{ name = "http", port = 80 }]
  backend_address_pools = [{ name = "backend" }]
  backend_http_settings = [{ name = "http", port = 80, protocol = "Http" }]
  http_listeners        = [{ name = "http", frontend_port_name = "http" }]
  request_routing_rules = [
    {
      name                       = "http"
      priority                   = 100
      http_listener_name         = "http"
      backend_address_pool_name  = "backend"
      backend_http_settings_name = "http"
    }
  ]

  tags = {
    "project" : "example"
  }
}
