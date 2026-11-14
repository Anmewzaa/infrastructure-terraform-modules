# ===========================================
# Example : Azurerm Private DNS Zone Virtual Network Link
# ===========================================
module "azurerm_private_dns_zone_virtual_network_link_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/private_dns_zone_virtual_network_link"

  name                  = "example-link"
  resource_group_name   = "example"
  private_dns_zone_name = "privatelink.blob.core.windows.net"
  virtual_network_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example/providers/Microsoft.Network/virtualNetworks/example"

  tags = {
    "project" : "example"
  }
}
