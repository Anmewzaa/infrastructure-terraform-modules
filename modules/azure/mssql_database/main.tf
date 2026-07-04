# ===========================================
# Resource : Azurerm MSSQL Database
# ===========================================
resource "azurerm_mssql_database" "this" {
  name      = var.name
  server_id = var.server_id

  sku_name         = var.sku_name
  max_size_gb      = var.max_size_gb
  collation        = var.collation
  license_type     = var.license_type
  create_mode      = var.create_mode
  elastic_pool_id  = var.elastic_pool_id
  read_scale       = var.read_scale
  zone_redundant   = var.zone_redundant

  transparent_data_encryption_enabled = var.transparent_data_encryption_enabled

  tags = var.tags
}
