# ===========================================
# Example : Azurerm Public IP
# ===========================================
module "azurerm_public_ip_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/public_ip"

  name                = "example-pip"
  resource_group_name = data.azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "example"
  }
}
