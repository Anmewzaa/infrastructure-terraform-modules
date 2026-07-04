# ===========================================
# Example : Azurerm Service Bus Namespace
# ===========================================
module "azurerm_servicebus_namespace_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/servicebus_namespace"

  name                = "example-servicebus"
  resource_group_name = data.azurerm_resource_group.example.name
  sku                 = "Standard"

  tags = {
    environment = "example"
  }
}
