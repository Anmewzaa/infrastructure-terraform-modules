# ===========================================
# Example : Azurerm Role Assignment
# ===========================================
module "azurerm_role_assignment_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/role_assignment"

  scope                = data.azurerm_resource_group.example.id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.current.object_id
}
