# ===========================================
# Resource : Azurerm Load Balancer
# ===========================================
resource "azurerm_lb" "this" {
  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  sku      = var.sku
  sku_tier = var.sku_tier

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configurations

    content {
      name                          = frontend_ip_configuration.value.name
      public_ip_address_id          = frontend_ip_configuration.value.public_ip_address_id
      subnet_id                     = frontend_ip_configuration.value.subnet_id
      private_ip_address            = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation = frontend_ip_configuration.value.subnet_id != null ? frontend_ip_configuration.value.private_ip_address_allocation : null
      zones                         = frontend_ip_configuration.value.zones
    }
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "this" {
  for_each = toset(var.backend_pool_names)

  name            = each.value
  loadbalancer_id = azurerm_lb.this.id
}

resource "azurerm_lb_probe" "this" {
  for_each = { for p in var.probes : p.name => p }

  name                = each.value.name
  loadbalancer_id     = azurerm_lb.this.id
  protocol            = each.value.protocol
  port                = each.value.port
  request_path        = each.value.request_path
  interval_in_seconds = each.value.interval_in_seconds
  probe_threshold     = each.value.probe_threshold
}

resource "azurerm_lb_rule" "this" {
  for_each = { for r in var.rules : r.name => r }

  name                           = each.value.name
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this[each.value.backend_pool_name].id]
  probe_id                       = each.value.probe_name != null ? azurerm_lb_probe.this[each.value.probe_name].id : null
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  floating_ip_enabled            = each.value.floating_ip_enabled
  disable_outbound_snat          = each.value.disable_outbound_snat
}
