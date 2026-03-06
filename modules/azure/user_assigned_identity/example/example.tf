# =========================================== 
# Example : Azurerm User Assigned Identity
# =========================================== 
module "azurerm_user_assigned_identity_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/user_assigned_identity"

  name                = "example"
  resource_group_name = "example"

  tags     = {
    "project" : "example"
  }
}