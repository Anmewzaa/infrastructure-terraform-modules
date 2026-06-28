# ===========================================
# Resource : Google Compute Firewall
# ===========================================
resource "google_compute_firewall" "this" {
  name    = var.name
  project = var.project
  network = var.network

  description = var.description
  direction   = var.direction
  priority    = var.priority
  disabled    = var.disabled

  source_ranges           = var.source_ranges
  destination_ranges      = var.destination_ranges
  source_tags             = var.source_tags
  target_tags             = var.target_tags
  source_service_accounts = var.source_service_accounts
  target_service_accounts = var.target_service_accounts

  dynamic "allow" {
    for_each = var.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  dynamic "deny" {
    for_each = var.deny
    content {
      protocol = deny.value.protocol
      ports    = deny.value.ports
    }
  }

  dynamic "log_config" {
    for_each = var.log_config_metadata != null ? [var.log_config_metadata] : []
    content {
      metadata = log_config.value
    }
  }
}
