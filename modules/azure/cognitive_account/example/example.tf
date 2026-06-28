# ===========================================
# Example : Azurerm Cognitive Account
# ===========================================
module "azurerm_cognitive_account_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/cognitive_account"

  name                = "example-cogsvc"
  resource_group_name = data.azurerm_resource_group.example.name

  kind                  = "OpenAI"
  sku_name              = "S0"
  custom_subdomain_name = "example-cogsvc"

  tags = {
    "project" : "example"
  }
}
