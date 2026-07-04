# ===========================================
# Variables : Azurerm PostgreSQL Flexible Server
# ===========================================
# Required
# - name
# - resource_group_name
# - version
#
# Optional
# - administrator_login
# - administrator_password
# - sku_name
# - storage_mb
# - storage_tier
# - zone
# - delegated_subnet_id
# - private_dns_zone_id
# - public_network_access_enabled
# - backup_retention_days
# - high_availability_mode
# - high_availability_standby_zone
# - tags

variable "name" {
  description = "Name of the PostgreSQL Flexible Server (globally unique)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the server in."
  type        = string
}

variable "version" {
  description = "PostgreSQL version (e.g. 14, 15, 16)."
  type        = string
  default     = "16"
}

variable "administrator_login" {
  description = "Administrator login name."
  type        = string
  default     = null
}

variable "administrator_password" {
  description = "Administrator login password."
  type        = string
  default     = null
  sensitive   = true
}

variable "sku_name" {
  description = "SKU name (e.g. B_Standard_B1ms, GP_Standard_D2s_v3)."
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
  description = "Storage capacity in MB."
  type        = number
  default     = 32768
}

variable "storage_tier" {
  description = "Storage performance tier (e.g. P4, P6, P10). Auto-selected if null."
  type        = string
  default     = null
}

variable "zone" {
  description = "Availability zone to place the server in (1, 2, or 3)."
  type        = string
  default     = null
}

variable "delegated_subnet_id" {
  description = "Subnet ID for private deployment via VNet integration."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "Private DNS zone ID. Required when delegated_subnet_id is set."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = "Backup retention in days (7-35)."
  type        = number
  default     = 7
}

variable "high_availability_mode" {
  description = "HA mode. One of: SameZone, ZoneRedundant. Null disables HA."
  type        = string
  default     = null
}

variable "high_availability_standby_zone" {
  description = "Availability zone for the HA standby server."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the PostgreSQL Flexible Server."
  type        = map(string)
  default     = {}
}
