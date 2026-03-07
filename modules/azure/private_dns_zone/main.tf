# =========================================== 
# Resource : Azurerm Private DNS Zone
# =========================================== 
resource "azurerm_private_dns_zone" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name

  tags = var.tags
}