# ===========================================
# Data : Azurerm Subscription / Policy Definition
# ===========================================
data "azurerm_subscription" "current" {}

data "azurerm_policy_definition" "example" {
  display_name = "Allowed locations"
}
