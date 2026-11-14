# ===========================================
# Example : Azurerm Event Grid Topic
# ===========================================
module "azurerm_eventgrid_topic_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/eventgrid_topic"

  name                = "example-egt"
  resource_group_name = "example"

  tags = {
    "project" : "example"
  }
}
