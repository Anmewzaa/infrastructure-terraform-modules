# ===========================================
# Example : Azurerm Service Bus Queue
# ===========================================
module "azurerm_servicebus_queue_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/servicebus_queue"

  name         = "example-queue"
  namespace_id = data.azurerm_servicebus_namespace.example.id

  max_delivery_count = 10
  lock_duration      = "PT1M"
}
