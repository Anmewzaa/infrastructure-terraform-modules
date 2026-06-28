# ===========================================
# Data : Azurerm Kubernetes Cluster
# ===========================================
# resource group name
data "azurerm_resource_group" "example" {
  name = "example"
}
data "azurerm_subnet" "example" {
  name                 = "example-subnet"
  virtual_network_name = "example-vnet"
  resource_group_name  = data.azurerm_resource_group.example.name
}
data "azurerm_key_vault_key" "example" {
  name         = "example-aks-kms-key"
  key_vault_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.KeyVault/vaults/example-kv"
}
