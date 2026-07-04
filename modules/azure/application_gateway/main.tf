# ===========================================
# Resource : Azurerm Application Gateway
# ===========================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  tags                = var.tags

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.autoscale_configuration == null ? var.capacity : null

    dynamic "autoscale_configuration" {
      for_each = var.autoscale_configuration != null ? [var.autoscale_configuration] : []
      content {
        min_capacity = autoscale_configuration.value.min_capacity
        max_capacity = lookup(autoscale_configuration.value, "max_capacity", null)
      }
    }
  }

  dynamic "gateway_ip_configuration" {
    for_each = var.gateway_ip_configurations
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = gateway_ip_configuration.value.subnet_id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configurations
    content {
      name                          = frontend_ip_configuration.value.name
      public_ip_address_id          = lookup(frontend_ip_configuration.value, "public_ip_address_id", null)
      private_ip_address            = lookup(frontend_ip_configuration.value, "private_ip_address", null)
      subnet_id                     = lookup(frontend_ip_configuration.value, "subnet_id", null)
      private_ip_address_allocation = lookup(frontend_ip_configuration.value, "private_ip_address_allocation", null)
    }
  }

  dynamic "frontend_port" {
    for_each = var.frontend_ports
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  dynamic "backend_address_pool" {
    for_each = var.backend_address_pools
    content {
      name         = backend_address_pool.value.name
      fqdns        = lookup(backend_address_pool.value, "fqdns", null)
      ip_addresses = lookup(backend_address_pool.value, "ip_addresses", null)
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings
    content {
      name                  = backend_http_settings.value.name
      cookie_based_affinity = lookup(backend_http_settings.value, "cookie_based_affinity", "Disabled")
      port                  = backend_http_settings.value.port
      protocol              = lookup(backend_http_settings.value, "protocol", "Http")
      request_timeout       = lookup(backend_http_settings.value, "request_timeout", 30)
      host_name             = lookup(backend_http_settings.value, "host_name", null)
      probe_name            = lookup(backend_http_settings.value, "probe_name", null)
    }
  }

  dynamic "http_listener" {
    for_each = var.http_listeners
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = lookup(http_listener.value, "protocol", "Http")
      host_name                      = lookup(http_listener.value, "host_name", null)
      ssl_certificate_name           = lookup(http_listener.value, "ssl_certificate_name", null)
    }
  }

  dynamic "request_routing_rule" {
    for_each = var.request_routing_rules
    content {
      name                        = request_routing_rule.value.name
      rule_type                   = lookup(request_routing_rule.value, "rule_type", "Basic")
      http_listener_name          = request_routing_rule.value.http_listener_name
      backend_address_pool_name   = lookup(request_routing_rule.value, "backend_address_pool_name", null)
      backend_http_settings_name  = lookup(request_routing_rule.value, "backend_http_settings_name", null)
      redirect_configuration_name = lookup(request_routing_rule.value, "redirect_configuration_name", null)
      url_path_map_name           = lookup(request_routing_rule.value, "url_path_map_name", null)
      priority                    = lookup(request_routing_rule.value, "priority", 100)
    }
  }

  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name                = ssl_certificate.value.name
      data                = lookup(ssl_certificate.value, "data", null)
      password            = lookup(ssl_certificate.value, "password", null)
      key_vault_secret_id = lookup(ssl_certificate.value, "key_vault_secret_id", null)
    }
  }

  dynamic "probe" {
    for_each = var.probes
    content {
      name                = probe.value.name
      host                = lookup(probe.value, "host", null)
      interval            = lookup(probe.value, "interval", 30)
      path                = lookup(probe.value, "path", "/")
      protocol            = lookup(probe.value, "protocol", "Http")
      timeout             = lookup(probe.value, "timeout", 30)
      unhealthy_threshold = lookup(probe.value, "unhealthy_threshold", 3)
      pick_host_name_from_backend_http_settings = lookup(probe.value, "pick_host_name_from_backend_http_settings", false)
    }
  }

  dynamic "waf_configuration" {
    for_each = var.waf_configuration != null ? [var.waf_configuration] : []
    content {
      enabled          = lookup(waf_configuration.value, "enabled", true)
      firewall_mode    = lookup(waf_configuration.value, "firewall_mode", "Detection")
      rule_set_type    = lookup(waf_configuration.value, "rule_set_type", "OWASP")
      rule_set_version = lookup(waf_configuration.value, "rule_set_version", "3.2")
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }
}
