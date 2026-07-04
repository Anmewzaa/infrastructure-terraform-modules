# ===========================================
# Example : Azurerm Application Gateway
# ===========================================
module "azurerm_application_gateway_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/application_gateway"

  name                = "example-appgw"
  resource_group_name = data.azurerm_resource_group.example.name

  sku_name = "Standard_v2"
  sku_tier = "Standard_v2"
  capacity = 2

  gateway_ip_configurations = [
    {
      name      = "example-gateway-ip-config"
      subnet_id = data.azurerm_subnet.appgw.id
    }
  ]

  frontend_ip_configurations = [
    {
      name                 = "example-frontend-ip-config"
      public_ip_address_id = data.azurerm_public_ip.example.id
    }
  ]

  frontend_ports = [
    { name = "http-port", port = 80 }
  ]

  backend_address_pools = [
    {
      name         = "example-backend-pool"
      ip_addresses = ["10.0.1.10", "10.0.1.11"]
    }
  ]

  backend_http_settings = [
    {
      name            = "example-http-settings"
      port            = 80
      protocol        = "Http"
      request_timeout = 30
    }
  ]

  http_listeners = [
    {
      name                           = "example-listener"
      frontend_ip_configuration_name = "example-frontend-ip-config"
      frontend_port_name             = "http-port"
      protocol                       = "Http"
    }
  ]

  request_routing_rules = [
    {
      name                       = "example-routing-rule"
      http_listener_name         = "example-listener"
      backend_address_pool_name  = "example-backend-pool"
      backend_http_settings_name = "example-http-settings"
      priority                   = 100
    }
  ]

  tags = {
    environment = "example"
  }
}
