# ===========================================
# Example : Azurerm Private Endpoint
# ===========================================
module "azurerm_private_endpoint_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/private_endpoint"

  name                = "example-pe"
  resource_group_name = data.azurerm_resource_group.example.name

  subnet_id                      = data.azurerm_subnet.example.id
  private_connection_resource_id = data.azurerm_storage_account.example.id
  subresource_names              = ["blob"]

  tags = {
    "project" : "example"
  }
}
