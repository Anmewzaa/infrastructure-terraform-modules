# ===========================================
# Example : Azurerm Service Bus Namespace
# ===========================================
module "azurerm_servicebus_namespace_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/servicebus_namespace"

  name                = "example-sb"
  resource_group_name = "example"

  tags = {
    "project" : "example"
  }
}
