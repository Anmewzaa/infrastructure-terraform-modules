# ===========================================
# Resource : Azurerm Key Vault
# ===========================================
locals {
  tenant_id = coalesce(var.tenant_id, data.azurerm_client_config.current.tenant_id)
}

resource "azurerm_key_vault" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  tenant_id           = local.tenant_id
  sku_name            = var.sku_name

  enable_rbac_authorization     = var.enable_rbac_authorization
  purge_protection_enabled      = var.purge_protection_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  public_network_access_enabled = var.public_network_access_enabled

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []

    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }

  dynamic "access_policy" {
    for_each = var.enable_rbac_authorization ? [] : var.access_policies

    content {
      tenant_id               = coalesce(access_policy.value.tenant_id, local.tenant_id)
      object_id               = access_policy.value.object_id
      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
      certificate_permissions = access_policy.value.certificate_permissions
    }
  }

  tags = var.tags
}
