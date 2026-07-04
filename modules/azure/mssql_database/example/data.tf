# ===========================================
# Data : Azurerm MSSQL Server
# ===========================================
data "azurerm_mssql_server" "example" {
  name                = "example-sql-server"
  resource_group_name = "example-resource-group"
}
