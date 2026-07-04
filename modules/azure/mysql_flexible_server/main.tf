# ===========================================
# Resource : Azurerm MySQL Flexible Server
# ===========================================
resource "azurerm_mysql_flexible_server" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  sku_name = var.sku_name
  version  = var.mysql_version
  zone     = var.zone

  delegated_subnet_id           = var.delegated_subnet_id
  private_dns_zone_id           = var.private_dns_zone_id
  public_network_access_enabled = var.public_network_access_enabled

  backup_retention_days      = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  dynamic "high_availability" {
    for_each = var.high_availability_mode != null ? [var.high_availability_mode] : []
    content {
      mode                      = high_availability.value
      standby_availability_zone = var.high_availability_standby_zone
    }
  }

  dynamic "storage" {
    for_each = var.storage != null ? [var.storage] : []
    content {
      size_gb       = lookup(storage.value, "size_gb", null)
      iops          = lookup(storage.value, "iops", null)
      auto_grow_enabled = lookup(storage.value, "auto_grow_enabled", true)
    }
  }

  tags = var.tags
}
