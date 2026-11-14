# ===========================================
# Example : Azurerm MSSQL Server
# ===========================================
module "azurerm_mssql_server_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/mssql_server"

  name                = "example-sql"
  resource_group_name = "example"

  administrator_login          = "sqladmin"
  administrator_login_password = "ChangeMe-Use-A-Secret!" # use a secret store / TF_VAR in real usage

  tags = {
    "project" : "example"
  }
}
