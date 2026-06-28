# ===========================================
# Example : Google Compute Network
# ===========================================
module "gcp_compute_network_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/gcp/compute_network"

  name    = "example-vpc"
  project = "example-project"

  routing_mode = "REGIONAL"

  subnets = [
    {
      name                     = "example-subnet"
      region                   = "asia-southeast1"
      ip_cidr_range            = "10.0.0.0/24"
      private_ip_google_access = true
    }
  ]
}
