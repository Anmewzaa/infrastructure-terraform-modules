# ===========================================
# Resource : Azurerm PostgreSQL Flexible Server
# ===========================================
resource "azurerm_postgresql_flexible_server" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  version             = var.version

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  sku_name    = var.sku_name
  storage_mb  = var.storage_mb
  storage_tier = var.storage_tier
  zone        = var.zone

  delegated_subnet_id           = var.delegated_subnet_id
  private_dns_zone_id           = var.private_dns_zone_id
  public_network_access_enabled = var.public_network_access_enabled
  backup_retention_days         = var.backup_retention_days

  dynamic "high_availability" {
    for_each = var.high_availability_mode != null ? [var.high_availability_mode] : []
    content {
      mode                      = high_availability.value
      standby_availability_zone = var.high_availability_standby_zone
    }
  }

  tags = var.tags
}
