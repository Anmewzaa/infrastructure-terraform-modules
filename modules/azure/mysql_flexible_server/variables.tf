# ===========================================
# Variables : Azurerm MySQL Flexible Server
# ===========================================
# Required
# - name
# - resource_group_name
#
# Optional
# - administrator_login
# - administrator_password
# - sku_name
# - mysql_version
# - zone
# - delegated_subnet_id
# - private_dns_zone_id
# - public_network_access_enabled
# - backup_retention_days
# - geo_redundant_backup_enabled
# - high_availability_mode
# - high_availability_standby_zone
# - storage
# - tags

variable "name" {
  description = "Name of the MySQL Flexible Server."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the server in."
  type        = string
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
  description = "SKU name (e.g. GP_Standard_D2ds_v4, B_Standard_B1ms)."
  type        = string
  default     = "GP_Standard_D2ds_v4"
}

variable "mysql_version" {
  description = "MySQL version (5.7, 8.0.21, or 8.4)."
  type        = string
  default     = "8.0.21"
}

variable "zone" {
  description = "Availability zone (1, 2, or 3)."
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
  description = "Backup retention in days (1-35)."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Whether geo-redundant backup is enabled."
  type        = bool
  default     = false
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

variable "storage" {
  description = "Storage configuration block with optional size_gb, iops, and auto_grow_enabled."
  type = object({
    size_gb           = optional(number)
    iops              = optional(number)
    auto_grow_enabled = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the MySQL Flexible Server."
  type        = map(string)
  default     = {}
}
