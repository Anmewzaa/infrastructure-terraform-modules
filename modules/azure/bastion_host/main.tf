# ===========================================
# Resource : Azurerm Bastion Host
# ===========================================
resource "azurerm_bastion_host" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku                    = var.sku
  scale_units            = var.scale_units
  copy_paste_enabled     = var.copy_paste_enabled
  file_copy_enabled      = var.file_copy_enabled
  ip_connect_enabled     = var.ip_connect_enabled
  shareable_link_enabled = var.shareable_link_enabled
  tunneling_enabled      = var.tunneling_enabled

  ip_configuration {
    name                 = "${var.name}-ipconfig"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }

  tags = var.tags
}
