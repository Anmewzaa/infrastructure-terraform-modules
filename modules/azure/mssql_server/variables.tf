# ===========================================
# Variables : Azurerm MSSQL Server
# (require)
# - name
# - resource_group_name
# (optional)
# - server_version
# - administrator_login
# - administrator_login_password
# - minimum_tls_version
# - public_network_access_enabled
# - azuread_administrator
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the SQL Server (globally unique). Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "server_version" {
  type        = string
  description = "(Optional) The version for the SQL Server. Valid values are 2.0 (v11 server) and 12.0 (v12 server)."
  default     = "12.0"
}
variable "administrator_login" {
  type        = string
  description = "(Optional) The administrator login name. Required unless azuread_authentication_only is true."
  default     = null
}
variable "administrator_login_password" {
  type        = string
  description = "(Optional) The password associated with the administrator_login."
  default     = null
  sensitive   = true
}
variable "minimum_tls_version" {
  type        = string
  description = "(Optional) The minimum TLS version. Valid values are 1.0, 1.1, 1.2 and Disabled."
  default     = "1.2"
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this server."
  default     = true
}
variable "azuread_administrator" {
  type        = object({ login_username = string, object_id = string, tenant_id = optional(string), azuread_authentication_only = optional(bool, false) })
  description = "(Optional) Microsoft Entra administrator configuration. Leave null to skip."
  default     = null
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
