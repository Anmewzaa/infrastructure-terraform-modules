# =========================================== 
# Example : Azurerm Resource Group       
# =========================================== 
module "azurerm_resource_group_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/resource_group"

  name     = "example"
  location = "southeastasia"
  tags     = {
    "project" : "example"
  }
}