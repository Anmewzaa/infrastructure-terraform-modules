# ===========================================
# Data : Google Compute Network
# ===========================================
data "google_compute_network" "example" {
  name    = "example-vpc"
  project = "example-project"
}
