# ===========================================
# Resource : Azurerm Kubernetes Cluster
# ===========================================
resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  sku_tier            = var.sku_tier

  private_cluster_enabled   = var.private_cluster_enabled
  azure_policy_enabled      = var.azure_policy_enabled
  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled

  default_node_pool {
    name                 = var.default_node_pool.name
    vm_size              = var.default_node_pool.vm_size
    node_count           = var.default_node_pool.auto_scaling_enabled ? null : var.default_node_pool.node_count
    auto_scaling_enabled = var.default_node_pool.auto_scaling_enabled
    min_count            = var.default_node_pool.auto_scaling_enabled ? var.default_node_pool.min_count : null
    max_count            = var.default_node_pool.auto_scaling_enabled ? var.default_node_pool.max_count : null
    vnet_subnet_id       = var.default_node_pool.vnet_subnet_id
    os_disk_size_gb      = var.default_node_pool.os_disk_size_gb
    zones                = var.default_node_pool.zones
  }

  identity {
    type         = var.identity_type
    identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  dynamic "key_management_service" {
    for_each = var.kms_enabled ? [1] : []

    content {
      key_vault_key_id         = var.kms_key_vault_key_id
      key_vault_network_access = var.kms_key_vault_network_access
    }
  }

  tags = var.tags
}
