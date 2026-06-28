# ===========================================
# Output : Google Compute Network
# ===========================================
output "id" {
  value = google_compute_network.this.id
}
output "name" {
  value = google_compute_network.this.name
}
output "self_link" {
  value = google_compute_network.this.self_link
}
output "subnet_ids" {
  value = { for name, subnet in google_compute_subnetwork.this : name => subnet.id }
}
output "subnet_self_links" {
  value = { for name, subnet in google_compute_subnetwork.this : name => subnet.self_link }
}
