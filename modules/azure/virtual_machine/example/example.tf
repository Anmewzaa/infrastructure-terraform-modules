# ===========================================
# Example : Azurerm Virtual Machine
# ===========================================
module "azurerm_virtual_machine_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/virtual_machine"

  name                = "example-vm"
  resource_group_name = data.azurerm_resource_group.example.name

  size           = "Standard_B2s"
  admin_username = "azureuser"
  subnet_id      = data.azurerm_subnet.example.id

  os_type               = "Linux"
  admin_ssh_public_key  = file("~/.ssh/id_rsa.pub")

  tags = {
    "project" : "example"
  }
}
