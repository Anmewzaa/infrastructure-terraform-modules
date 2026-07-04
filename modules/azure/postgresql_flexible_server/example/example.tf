# ===========================================
# Example : Azurerm PostgreSQL Flexible Server
# ===========================================
module "azurerm_postgresql_flexible_server_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/postgresql_flexible_server"

  name                = "example-psql-server"
  resource_group_name = data.azurerm_resource_group.example.name
  version             = "16"

  administrator_login    = "psqladmin"
  administrator_password = "P@ssw0rd1234!"

  sku_name   = "GP_Standard_D2s_v3"
  storage_mb = 32768

  backup_retention_days = 7

  tags = {
    environment = "example"
  }
}
