# ===========================================
# Output : TencentCloud VPC
# ===========================================
output "id" {
  value = tencentcloud_vpc.this.id
}
output "name" {
  value = tencentcloud_vpc.this.name
}
output "is_default" {
  value = tencentcloud_vpc.this.is_default
}
output "default_route_table_id" {
  value = tencentcloud_vpc.this.default_route_table_id
}
