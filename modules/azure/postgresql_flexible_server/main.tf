# ===========================================
# Resource : Azurerm PostgreSQL Flexible Server
# ===========================================
locals {
  public_network_access_enabled = var.delegated_subnet_id != null ? false : var.public_network_access_enabled
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  version                = var.server_version
  sku_name               = var.sku_name
  storage_mb             = var.storage_mb
  zone                   = var.zone
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  delegated_subnet_id           = var.delegated_subnet_id
  private_dns_zone_id           = var.private_dns_zone_id
  public_network_access_enabled = local.public_network_access_enabled

  authentication {
    active_directory_auth_enabled = var.active_directory_auth_enabled
    password_auth_enabled         = var.password_auth_enabled
    tenant_id                     = var.tenant_id
  }

  dynamic "high_availability" {
    for_each = var.high_availability_mode != null ? [var.high_availability_mode] : []

    content {
      mode                      = high_availability.value
      standby_availability_zone = var.standby_availability_zone
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [zone]
  }
}
