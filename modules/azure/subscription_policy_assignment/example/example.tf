# ===========================================
# Example : Azurerm Subscription Policy Assignment
# ===========================================
module "azurerm_subscription_policy_assignment_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/subscription_policy_assignment"

  name                 = "example-policy-assignment"
  policy_definition_id = data.azurerm_policy_definition.example.id
  subscription_id      = data.azurerm_subscription.current.id

  display_name = "Allowed Locations Policy"
  enforce      = true
}
