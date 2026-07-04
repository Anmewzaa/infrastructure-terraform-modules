# ===========================================
# Example : Azurerm MSSQL Database
# ===========================================
module "azurerm_mssql_database_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/mssql_database"

  name      = "example-database"
  server_id = data.azurerm_mssql_server.example.id

  sku_name    = "S1"
  max_size_gb = 20

  tags = {
    environment = "example"
  }
}
