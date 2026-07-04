# ===========================================
# Example : Azurerm Event Hub
# ===========================================
module "azurerm_eventhub_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/eventhub"

  name             = "example-eventhub"
  namespace_id     = data.azurerm_eventhub_namespace.example.id
  partition_count  = 2
  message_retention = 1
}
