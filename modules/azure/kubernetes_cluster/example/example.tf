# ===========================================
# Example : Azurerm Kubernetes Cluster
# ===========================================
module "azurerm_kubernetes_cluster_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/kubernetes_cluster"

  name                = "example-aks"
  resource_group_name = data.azurerm_resource_group.example.name
  dns_prefix          = "example-aks"

  default_node_pool = {
    name                 = "default"
    vm_size              = "Standard_D2s_v5"
    auto_scaling_enabled = true
    min_count            = 1
    max_count            = 3
    vnet_subnet_id       = data.azurerm_subnet.example.id
  }

  identity_type = "SystemAssigned"

  kms_enabled           = true
  kms_key_vault_key_id  = data.azurerm_key_vault_key.example.id

  tags = {
    "project" : "example"
  }
}
