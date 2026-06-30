# ===========================================
# Resource : TencentCloud VPC
# ===========================================
resource "tencentcloud_vpc" "this" {
  name       = var.name
  cidr_block = var.cidr_block

  assistant_cidrs               = var.assistant_cidrs
  dns_servers                   = var.dns_servers
  is_multicast                  = var.is_multicast
  enable_route_vpc_publish      = var.enable_route_vpc_publish
  enable_route_vpc_publish_ipv6 = var.enable_route_vpc_publish_ipv6

  tags = var.tags
}
