# ===========================================
# Example : Azurerm Key Vault Secret
# ===========================================
module "azurerm_key_vault_secret_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/key_vault_secret"

  name         = "example-secret"
  key_vault_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.KeyVault/vaults/example"
  value        = "change-me" # pass from a secret source / TF_VAR in real usage

  tags = {
    "project" : "example"
  }
}
