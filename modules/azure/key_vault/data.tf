# ===========================================
# Data : Azurerm Key Vault
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
data "azurerm_client_config" "current" {}
