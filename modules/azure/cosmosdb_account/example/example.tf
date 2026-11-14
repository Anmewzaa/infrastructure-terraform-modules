# ===========================================
# Example : Azurerm Cosmos DB Account
# ===========================================
module "azurerm_cosmosdb_account_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/cosmosdb_account"

  name                = "example-cosmos"
  resource_group_name = "example"

  tags = {
    "project" : "example"
  }
}
