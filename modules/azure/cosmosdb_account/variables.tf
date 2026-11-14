# ===========================================
# Variables : Azurerm Cosmos DB Account
# (require)
# - name
# - resource_group_name
# (optional)
# - offer_type
# - kind
# - consistency_level
# - max_interval_in_seconds
# - max_staleness_prefix
# - geo_locations
# - capabilities
# - automatic_failover_enabled
# - free_tier_enabled
# - local_authentication_disabled
# - public_network_access_enabled
# - ip_range_filter
# - virtual_network_subnet_ids
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Cosmos DB account (globally unique). Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "offer_type" {
  type        = string
  description = "(Optional) The Offer Type to use for this CosmosDB Account. Currently only Standard."
  default     = "Standard"
}
variable "kind" {
  type        = string
  description = "(Optional) The kind of account: GlobalDocumentDB or MongoDB."
  default     = "GlobalDocumentDB"
}
variable "consistency_level" {
  type        = string
  description = "(Optional) The consistency level: BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
  default     = "Session"
}
variable "max_interval_in_seconds" {
  type        = number
  description = "(Optional) Max lag time in seconds (BoundedStaleness only)."
  default     = 5
}
variable "max_staleness_prefix" {
  type        = number
  description = "(Optional) Max stale requests (BoundedStaleness only)."
  default     = 100
}
variable "geo_locations" {
  type        = list(object({ location = string, failover_priority = number, zone_redundant = optional(bool, false) }))
  description = "(Optional) The geographic locations the data is replicated to. When empty, the resource group location is used as the primary (failover_priority 0)."
  default     = []
}
variable "capabilities" {
  type        = list(string)
  description = "(Optional) A list of capabilities to enable, e.g. EnableServerless, EnableMongo."
  default     = []
}
variable "automatic_failover_enabled" {
  type        = bool
  description = "(Optional) Enable automatic failover for this account."
  default     = false
}
variable "free_tier_enabled" {
  type        = bool
  description = "(Optional) Enable the Free Tier pricing option for this account."
  default     = false
}
variable "local_authentication_disabled" {
  type        = bool
  description = "(Optional) Disable local (key based) authentication and only allow Microsoft Entra authentication."
  default     = false
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this account."
  default     = true
}
variable "ip_range_filter" {
  type        = list(string)
  description = "(Optional) A list of IP addresses or CIDR ranges allowed to access the account."
  default     = []
}
variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "(Optional) A list of subnet IDs allowed to access the account (service endpoints)."
  default     = []
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
