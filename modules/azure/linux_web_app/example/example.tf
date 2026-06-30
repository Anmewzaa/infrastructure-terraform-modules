# ===========================================
# Example : Azurerm Linux Web App
# ===========================================
module "azurerm_linux_web_app_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/linux_web_app"

  name                = "example-web-app"
  resource_group_name = data.azurerm_resource_group.example.name
  service_plan_id     = data.azurerm_service_plan.example.id

  https_only = true

  application_stack = {
    node_version = "18-lts"
  }

  app_settings = {
    NODE_ENV = "production"
  }

  identity_type = "SystemAssigned"

  tags = {
    environment = "example"
  }
}
