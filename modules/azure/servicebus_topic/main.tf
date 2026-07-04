# ===========================================
# Resource : Azurerm Service Bus Topic
# ===========================================
resource "azurerm_servicebus_topic" "this" {
  name         = var.name
  namespace_id = var.namespace_id

  status                = var.status
  partitioning_enabled  = var.partitioning_enabled
  max_size_in_megabytes = var.max_size_in_megabytes
  default_message_ttl   = var.default_message_ttl
  support_ordering      = var.support_ordering
}
