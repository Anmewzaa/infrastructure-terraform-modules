# ===========================================
# Variables : Azurerm Log Analytics Workspace
# ===========================================
# Required
# - name
# - resource_group_name
#
# Optional
# - sku
# - retention_in_days
# - daily_quota_gb
# - allow_resource_only_permissions
# - local_authentication_enabled
# - internet_ingestion_enabled
# - internet_query_enabled
# - cmk_for_query_forced
# - identity_type
# - identity_ids
# - tags

variable "name" {
  description = "Name of the Log Analytics Workspace (4-63 characters, letters/digits/hyphens)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the Log Analytics Workspace in."
  type        = string
}

variable "sku" {
  description = "SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Number of days to retain data (30-730)."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. -1 means unlimited."
  type        = number
  default     = -1
}

variable "allow_resource_only_permissions" {
  description = "Whether users require permissions to the resource to view logs."
  type        = bool
  default     = true
}

variable "local_authentication_enabled" {
  description = "Whether local authentication is enabled."
  type        = bool
  default     = true
}

variable "internet_ingestion_enabled" {
  description = "Whether log ingestion over the public internet is enabled."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Whether log querying over the public internet is enabled."
  type        = bool
  default     = true
}

variable "cmk_for_query_forced" {
  description = "Whether customer-managed keys are required for query."
  type        = bool
  default     = null
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
  description = "Tags to apply to the Log Analytics Workspace."
  type        = map(string)
  default     = {}
}
