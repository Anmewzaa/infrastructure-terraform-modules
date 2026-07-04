# ===========================================
# Example : Azurerm MSSQL Server
# ===========================================
module "azurerm_mssql_server_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/mssql_server"

  name                = "example-sql-server"
  resource_group_name = data.azurerm_resource_group.example.name
  server_version      = "12.0"

  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"

  public_network_access_enabled = false
  identity_type                 = "SystemAssigned"

  tags = {
    environment = "example"
  }
}
