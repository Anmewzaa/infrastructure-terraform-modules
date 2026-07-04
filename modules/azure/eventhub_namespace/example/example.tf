# ===========================================
# Example : Azurerm Event Hub Namespace
# ===========================================
module "azurerm_eventhub_namespace_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/eventhub_namespace"

  name                = "example-eventhub-ns"
  resource_group_name = data.azurerm_resource_group.example.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = "example"
  }
}
