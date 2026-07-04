# ===========================================
# Resource : Azurerm Subscription Policy Assignment
# ===========================================
resource "azurerm_subscription_policy_assignment" "this" {
  name                 = var.name
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.subscription_id

  description  = var.description
  display_name = var.display_name
  enforce      = var.enforce
  location     = var.location
  parameters   = var.parameters

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []

    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }
}
