# ===========================================
# Resource : Azurerm Monitor Action Group
# ===========================================
resource "azurerm_monitor_action_group" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  short_name          = var.short_name
  enabled             = var.enabled

  dynamic "email_receiver" {
    for_each = var.email_receivers

    content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = email_receiver.value.use_common_alert_schema
    }
  }

  dynamic "sms_receiver" {
    for_each = var.sms_receivers

    content {
      name         = sms_receiver.value.name
      country_code = sms_receiver.value.country_code
      phone_number = sms_receiver.value.phone_number
    }
  }

  dynamic "webhook_receiver" {
    for_each = var.webhook_receivers

    content {
      name        = webhook_receiver.value.name
      service_uri = webhook_receiver.value.service_uri
    }
  }

  tags = var.tags
}
