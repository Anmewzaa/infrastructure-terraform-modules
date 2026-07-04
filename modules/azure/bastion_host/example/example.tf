# ===========================================
# Example : Azurerm Bastion Host
# ===========================================
module "azurerm_bastion_host_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/bastion_host"

  name                = "example-bastion"
  resource_group_name = data.azurerm_resource_group.example.name
  sku                 = "Basic"

  ip_configuration = {
    name                 = "example-ip-config"
    subnet_id            = data.azurerm_subnet.bastion.id
    public_ip_address_id = data.azurerm_public_ip.example.id
  }

  tags = {
    environment = "example"
  }
}
