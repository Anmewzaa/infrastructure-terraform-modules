# ===========================================
# Example : Azurerm Service Plan
# ===========================================
module "azurerm_service_plan_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/service_plan"

  name                = "example-service-plan"
  resource_group_name = data.azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"

  tags = {
    environment = "example"
  }
}
