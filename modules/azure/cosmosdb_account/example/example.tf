# ===========================================
# Example : Azurerm Cosmos DB Account
# ===========================================
module "azurerm_cosmosdb_account_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/cosmosdb_account"

  name                = "example-cosmosdb"
  resource_group_name = data.azurerm_resource_group.example.name

  kind              = "GlobalDocumentDB"
  consistency_level = "Session"

  geo_locations = [
    {
      location          = data.azurerm_resource_group.example.location
      failover_priority = 0
    }
  ]

  automatic_failover_enabled = false

  tags = {
    environment = "example"
  }
}
