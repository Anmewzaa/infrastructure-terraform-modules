# ===========================================
# Variables : TencentCloud VPC
# ===========================================
# Required
# - name
# - cidr_block
#
# Optional
# - assistant_cidrs
# - dns_servers
# - is_multicast
# - enable_route_vpc_publish
# - enable_route_vpc_publish_ipv6
# - tags

variable "name" {
  description = "Name of the VPC."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block of the VPC, must be a subnet of 10.0.0.0/16, 172.16.0.0/12, or 192.168.0.0/16."
  type        = string
}

variable "assistant_cidrs" {
  description = "Additional CIDR blocks for the VPC (NORMAL type VPCs only)."
  type        = set(string)
  default     = null
}

variable "dns_servers" {
  description = "DNS server addresses for the VPC (0-5 servers)."
  type        = set(string)
  default     = null
}

variable "is_multicast" {
  description = "Whether to enable multicast for the VPC."
  type        = bool
  default     = false
}

variable "enable_route_vpc_publish" {
  description = "Controls whether CCN route publishing is at the CIDR or subnet level."
  type        = bool
  default     = null
}

variable "enable_route_vpc_publish_ipv6" {
  description = "IPv6 route publishing policy for CCN association."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Tags to apply to the VPC."
  type        = map(string)
  default     = {}
}
