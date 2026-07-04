# ===========================================
# Variables : Azurerm Cosmos DB Account
# ===========================================
# Required
# - name
# - resource_group_name
# - geo_locations
#
# Optional
# - kind
# - consistency_level
# - max_interval_in_seconds
# - max_staleness_prefix
# - automatic_failover_enabled
# - multiple_write_locations_enabled
# - public_network_access_enabled
# - capabilities
# - identity_type
# - identity_ids
# - tags

variable "name" {
  description = "Name of the Cosmos DB Account (globally unique)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the Cosmos DB Account in."
  type        = string
}

variable "kind" {
  description = "Kind of Cosmos DB to create. One of: GlobalDocumentDB, MongoDB, Parse."
  type        = string
  default     = "GlobalDocumentDB"
}

variable "consistency_level" {
  description = "Consistency level. One of: BoundedStaleness, ConsistentPrefix, Eventual, Session, Strong."
  type        = string
  default     = "Session"
}

variable "max_interval_in_seconds" {
  description = "Max staleness interval (seconds). Required for BoundedStaleness."
  type        = number
  default     = 5
}

variable "max_staleness_prefix" {
  description = "Max staleness prefix operations. Required for BoundedStaleness."
  type        = number
  default     = 100
}

variable "geo_locations" {
  description = "List of geo-replication locations with location and failover_priority."
  type = list(object({
    location          = string
    failover_priority = number
    zone_redundant    = optional(bool)
  }))
}

variable "automatic_failover_enabled" {
  description = "Whether automatic failover is enabled."
  type        = bool
  default     = false
}

variable "multiple_write_locations_enabled" {
  description = "Whether multi-region writes are enabled."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed."
  type        = bool
  default     = true
}

variable "capabilities" {
  description = "List of capability names to enable (e.g. EnableMongo, EnableCassandra, EnableTable)."
  type        = list(string)
  default     = []
}

variable "identity_type" {
  description = "Managed identity type. One of: SystemAssigned, UserAssigned, SystemAssigned\\, UserAssigned."
  type        = string
  default     = null
}

variable "identity_ids" {
  description = "List of User Assigned Identity IDs. Required when identity_type includes UserAssigned."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the Cosmos DB Account."
  type        = map(string)
  default     = {}
}
