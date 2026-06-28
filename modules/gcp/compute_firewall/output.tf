# ===========================================
# Output : Google Compute Firewall
# ===========================================
output "id" {
  value = google_compute_firewall.this.id
}
output "name" {
  value = google_compute_firewall.this.name
}
output "self_link" {
  value = google_compute_firewall.this.self_link
}
