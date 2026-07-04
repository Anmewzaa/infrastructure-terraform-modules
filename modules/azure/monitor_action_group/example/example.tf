# ===========================================
# Example : Azurerm Monitor Action Group
# ===========================================
module "azurerm_monitor_action_group_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/monitor_action_group"

  name                = "example-action-group"
  resource_group_name = data.azurerm_resource_group.example.name
  short_name          = "example-ag"

  email_receivers = [
    {
      name          = "example-email"
      email_address = "example@example.com"
    }
  ]

  tags = {
    environment = "example"
  }
}
