# ===========================================
# Resource : Azurerm Linux Web App
# ===========================================
resource "azurerm_linux_web_app" "this" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  service_plan_id     = var.service_plan_id

  https_only   = var.https_only
  enabled      = var.enabled
  app_settings = var.app_settings

  site_config {
    always_on         = var.always_on
    minimum_tls_version = var.minimum_tls_version
    http2_enabled     = var.http2_enabled
    ftps_state        = var.ftps_state

    dynamic "application_stack" {
      for_each = var.application_stack != null ? [var.application_stack] : []
      content {
        node_version    = lookup(application_stack.value, "node_version", null)
        python_version  = lookup(application_stack.value, "python_version", null)
        php_version     = lookup(application_stack.value, "php_version", null)
        ruby_version    = lookup(application_stack.value, "ruby_version", null)
        java_version    = lookup(application_stack.value, "java_version", null)
        java_server     = lookup(application_stack.value, "java_server", null)
        java_server_version = lookup(application_stack.value, "java_server_version", null)
        go_version      = lookup(application_stack.value, "go_version", null)
        dotnet_version  = lookup(application_stack.value, "dotnet_version", null)
        docker_image_name        = lookup(application_stack.value, "docker_image_name", null)
        docker_registry_url      = lookup(application_stack.value, "docker_registry_url", null)
        docker_registry_username = lookup(application_stack.value, "docker_registry_username", null)
        docker_registry_password = lookup(application_stack.value, "docker_registry_password", null)
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []
    content {
      type         = identity.value
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], identity.value) ? var.identity_ids : null
    }
  }

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  tags = var.tags
}
