# ===========================================
# Data : Azurerm Event Hub Namespace
# ===========================================
data "azurerm_eventhub_namespace" "example" {
  name                = "example-eventhub-ns"
  resource_group_name = "example-resource-group"
}
