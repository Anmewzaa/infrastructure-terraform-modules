# ===========================================
# Variables : Azurerm Redis Cache
# (require)
# - name
# - resource_group_name
# (optional)
# - capacity
# - family
# - sku_name
# - redis_version
# - minimum_tls_version
# - non_ssl_port_enabled
# - public_network_access_enabled
# - subnet_id
# - shard_count
# - zones
# - maxmemory_policy
# - authentication_enabled
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Redis Cache (globally unique). Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "capacity" {
  type        = number
  description = "(Optional) The size of the Redis cache (0-6 depending on family)."
  default     = 1
}
variable "family" {
  type        = string
  description = "(Optional) The SKU family: C (Basic/Standard) or P (Premium)."
  default     = "C"
}
variable "sku_name" {
  type        = string
  description = "(Optional) The SKU of Redis: Basic, Standard or Premium."
  default     = "Standard"
}
variable "redis_version" {
  type        = string
  description = "(Optional) Redis version. Only major version is needed (4 or 6)."
  default     = "6"
}
variable "minimum_tls_version" {
  type        = string
  description = "(Optional) The minimum TLS version: 1.0, 1.1 or 1.2."
  default     = "1.2"
}
variable "non_ssl_port_enabled" {
  type        = bool
  description = "(Optional) Enable the non-SSL port (6379)."
  default     = false
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this cache."
  default     = true
}
variable "subnet_id" {
  type        = string
  description = "(Optional) The ID of the subnet to deploy the cache in. Only for Premium SKU."
  default     = null
}
variable "shard_count" {
  type        = number
  description = "(Optional) Number of shards for a Premium cluster."
  default     = null
}
variable "zones" {
  type        = list(string)
  description = "(Optional) Availability zones to deploy the cache in. Premium only."
  default     = null
}
variable "maxmemory_policy" {
  type        = string
  description = "(Optional) The eviction policy when the memory limit is reached."
  default     = "volatile-lru"
}
variable "authentication_enabled" {
  type        = bool
  description = "(Optional) Enable Redis authentication (access keys)."
  default     = true
}
variable "identity_type" {
  type        = string
  description = "(Optional) The type of Managed Identity: SystemAssigned, UserAssigned or 'SystemAssigned, UserAssigned'. Leave null for no identity."
  default     = null
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Managed Identity IDs. Used when identity_type includes UserAssigned."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
