# ===========================================
# Example : Azurerm Key Vault
# ===========================================
module "azurerm_key_vault_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/key_vault"

  name                = "example-kv"
  resource_group_name = data.azurerm_resource_group.example.name

  sku_name                   = "standard"
  enable_rbac_authorization = true

  tags = {
    "project" : "example"
  }
}
