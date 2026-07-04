# ===========================================
# Variables : Azurerm MSSQL Server
# ===========================================
# Required
# - name
# - resource_group_name
# - server_version
#
# Optional
# - administrator_login
# - administrator_login_password
# - minimum_tls_version
# - public_network_access_enabled
# - azuread_administrator
# - identity_type
# - identity_ids
# - tags

variable "name" {
  description = "Name of the MSSQL Server (globally unique)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the MSSQL Server in."
  type        = string
}

variable "server_version" {
  description = "SQL Server version. Use 12.0 for SQL Server 2014+."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "Administrator login name. Omit if using Azure AD only authentication."
  type        = string
  default     = null
}

variable "administrator_login_password" {
  description = "Administrator login password."
  type        = string
  default     = null
  sensitive   = true
}

variable "minimum_tls_version" {
  description = "Minimum TLS version enforced on connections."
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed."
  type        = bool
  default     = true
}

variable "azuread_administrator" {
  description = "Azure AD administrator configuration with login_username and object_id."
  type = object({
    login_username              = string
    object_id                   = string
    azuread_authentication_only = optional(bool)
  })
  default = null
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
  description = "Tags to apply to the MSSQL Server."
  type        = map(string)
  default     = {}
}
