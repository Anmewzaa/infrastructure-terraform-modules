# ===========================================
# Example : Azurerm Storage Account
# ===========================================
module "azurerm_storage_account_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/storage_account"

  name                = "examplestorageacct"
  resource_group_name = data.azurerm_resource_group.example.name

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    "project" : "example"
  }
}
