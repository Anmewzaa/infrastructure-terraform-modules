# ===========================================
# Variables : Azurerm PostgreSQL Flexible Server
# (require)
# - name
# - resource_group_name
# (optional)
# - administrator_login
# - administrator_password
# - server_version
# - sku_name
# - storage_mb
# - zone
# - backup_retention_days
# - geo_redundant_backup_enabled
# - delegated_subnet_id
# - private_dns_zone_id
# - public_network_access_enabled
# - active_directory_auth_enabled
# - password_auth_enabled
# - tenant_id
# - high_availability_mode
# - standby_availability_zone
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the PostgreSQL Flexible Server. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "administrator_login" {
  type        = string
  description = "(Optional) The Administrator login for the server. Required when password authentication is enabled."
  default     = null
}
variable "administrator_password" {
  type        = string
  description = "(Optional) The Password associated with the administrator_login."
  default     = null
  sensitive   = true
}
variable "server_version" {
  type        = string
  description = "(Optional) The version of PostgreSQL Flexible Server to use. Possible values are 11, 12, 13, 14, 15, 16 and 17."
  default     = "16"
}
variable "sku_name" {
  type        = string
  description = "(Optional) The SKU Name for the server, e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3."
  default     = "B_Standard_B1ms"
}
variable "storage_mb" {
  type        = number
  description = "(Optional) The max storage allowed for the server in MB."
  default     = 32768
}
variable "zone" {
  type        = string
  description = "(Optional) The Availability Zone of the server."
  default     = null
}
variable "backup_retention_days" {
  type        = number
  description = "(Optional) The backup retention days for the server (7-35)."
  default     = 7
}
variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "(Optional) Is Geo-Redundant backup enabled on the server?"
  default     = false
}
variable "delegated_subnet_id" {
  type        = string
  description = "(Optional) The ID of the subnet delegated to Microsoft.DBforPostgreSQL/flexibleServers (VNet integration). When set, public network access is disabled."
  default     = null
}
variable "private_dns_zone_id" {
  type        = string
  description = "(Optional) The ID of the private DNS zone used with VNet integration. Required when delegated_subnet_id is set."
  default     = null
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Is public network access enabled? Forced to false when delegated_subnet_id is set."
  default     = true
}
variable "active_directory_auth_enabled" {
  type        = bool
  description = "(Optional) Is Microsoft Entra authentication enabled?"
  default     = false
}
variable "password_auth_enabled" {
  type        = bool
  description = "(Optional) Is password authentication enabled?"
  default     = true
}
variable "tenant_id" {
  type        = string
  description = "(Optional) The Tenant ID for Microsoft Entra authentication. Required when active_directory_auth_enabled is true."
  default     = null
}
variable "high_availability_mode" {
  type        = string
  description = "(Optional) The high availability mode: SameZone or ZoneRedundant. Leave null to disable high availability."
  default     = null
}
variable "standby_availability_zone" {
  type        = string
  description = "(Optional) The availability zone of the standby server when high availability is enabled."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
