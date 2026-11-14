# ===========================================
# Example : Azurerm Public IP
# ===========================================
module "azurerm_public_ip_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/public_ip"

  name                = "example-pip"
  resource_group_name = "example"

  tags = {
    "project" : "example"
  }
}
