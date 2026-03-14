# =========================================== 
# Resource : Azurerm User Assigned Identity
# =========================================== 
resource "azurerm_user_assigned_identity" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  tags                = var.tags

  depends_on = [
    azurerm_resource_group.this
  ]
}