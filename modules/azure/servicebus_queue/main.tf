# ===========================================
# Resource : Azurerm Service Bus Queue
# ===========================================
resource "azurerm_servicebus_queue" "this" {
  name         = var.name
  namespace_id = var.namespace_id

  lock_duration                        = var.lock_duration
  max_size_in_megabytes                = var.max_size_in_megabytes
  requires_session                     = var.requires_session
  dead_lettering_on_message_expiration = var.dead_lettering_on_message_expiration
  max_delivery_count                   = var.max_delivery_count
  partitioning_enabled                 = var.partitioning_enabled
  status                               = var.status
}
