# ===========================================
# Example : Azurerm Event Hub Namespace
# ===========================================
module "azurerm_eventhub_namespace_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/eventhub_namespace"

  name                = "example-ehns"
  resource_group_name = "example"

  tags = {
    "project" : "example"
  }
}
