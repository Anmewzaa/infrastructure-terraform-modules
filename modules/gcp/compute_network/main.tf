# ===========================================
# Resource : Google Compute Network
# ===========================================
resource "google_compute_network" "this" {
  name    = var.name
  project = var.project

  description                    = var.description
  auto_create_subnetworks        = var.auto_create_subnetworks
  routing_mode                   = var.routing_mode
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

resource "google_compute_subnetwork" "this" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name    = each.value.name
  project = var.project
  network = google_compute_network.this.id
  region  = each.value.region

  ip_cidr_range            = each.value.ip_cidr_range
  private_ip_google_access = each.value.private_ip_google_access

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip_ranges

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  dynamic "log_config" {
    for_each = each.value.flow_logs_enabled ? [1] : []

    content {
      aggregation_interval = "INTERVAL_5_SEC"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
}
