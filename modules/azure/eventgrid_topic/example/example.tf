# ===========================================
# Example : Azurerm Event Grid Topic
# ===========================================
module "azurerm_eventgrid_topic_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/eventgrid_topic"

  name                = "example-eventgrid-topic"
  resource_group_name = data.azurerm_resource_group.example.name

  input_schema = "EventGridSchema"

  tags = {
    environment = "example"
  }
}
