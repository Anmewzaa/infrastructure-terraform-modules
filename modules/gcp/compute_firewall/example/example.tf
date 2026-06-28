# ===========================================
# Example : Google Compute Firewall
# ===========================================
module "gcp_compute_firewall_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/gcp/compute_firewall"

  name    = "example-allow-internal"
  project = "example-project"
  network = data.google_compute_network.example.self_link

  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["10.0.0.0/8"]

  allow = [
    {
      protocol = "tcp"
      ports    = ["22", "443"]
    },
    {
      protocol = "icmp"
    }
  ]
}
