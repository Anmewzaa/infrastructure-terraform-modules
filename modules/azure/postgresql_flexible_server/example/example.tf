# ===========================================
# Example : Azurerm PostgreSQL Flexible Server
# ===========================================
module "azurerm_postgresql_flexible_server_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/postgresql_flexible_server"

  name                = "example-psql"
  resource_group_name = "example"

  administrator_login    = "psqladmin"
  administrator_password = "ChangeMe-Use-A-Secret!" # use a secret store / TF_VAR in real usage

  tags = {
    "project" : "example"
  }
}
