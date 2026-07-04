# ===========================================
# Example : Azurerm MySQL Flexible Server
# ===========================================
module "azurerm_mysql_flexible_server_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/mysql_flexible_server"

  name                = "example-mysql-server"
  resource_group_name = data.azurerm_resource_group.example.name

  administrator_login    = "mysqladmin"
  administrator_password = "P@ssw0rd1234!"

  sku_name      = "GP_Standard_D2ds_v4"
  mysql_version = "8.0.21"

  backup_retention_days = 7

  tags = {
    environment = "example"
  }
}
