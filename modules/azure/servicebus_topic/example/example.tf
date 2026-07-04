# ===========================================
# Example : Azurerm Service Bus Topic
# ===========================================
module "azurerm_servicebus_topic_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/servicebus_topic"

  name         = "example-topic"
  namespace_id = data.azurerm_servicebus_namespace.example.id

  support_ordering = true
}
