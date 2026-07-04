# ===========================================
# Data : Azurerm Service Bus Namespace
# ===========================================
data "azurerm_servicebus_namespace" "example" {
  name                = "example-servicebus"
  resource_group_name = "example-resource-group"
}
