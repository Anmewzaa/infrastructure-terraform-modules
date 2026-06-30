# ===========================================
# Example : Azurerm Container Registry
# ===========================================
module "azurerm_container_registry_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/container_registry"

  name                = "exampleacr"
  resource_group_name = data.azurerm_resource_group.example.name
  sku                 = "Standard"
  admin_enabled       = false

  identity_type = "SystemAssigned"

  tags = {
    environment = "example"
  }
}
