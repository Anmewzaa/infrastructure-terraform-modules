# ===========================================
# Variables : Azurerm Application Insights
# ===========================================
# Required
# - name
# - resource_group_name
# - application_type
#
# Optional
# - workspace_id
# - retention_in_days
# - daily_data_cap_in_gb
# - daily_data_cap_notifications_enabled
# - sampling_percentage
# - ip_masking_enabled
# - local_authentication_enabled
# - internet_ingestion_enabled
# - internet_query_enabled
# - tags

variable "name" {
  description = "Name of the Application Insights component."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create Application Insights in."
  type        = string
}

variable "application_type" {
  description = "Type of Application Insights component. One of: ios, java, MobileCenter, Node.JS, other, phone, store, web."
  type        = string

  validation {
    condition     = contains(["ios", "java", "MobileCenter", "Node.JS", "other", "phone", "store", "web"], var.application_type)
    error_message = "application_type must be one of: ios, java, MobileCenter, Node.JS, other, phone, store, web."
  }
}

variable "workspace_id" {
  description = "ID of the Log Analytics Workspace to link (workspace-based Application Insights). Cannot be removed once set."
  type        = string
  default     = null
}

variable "retention_in_days" {
  description = "Data retention in days. One of: 30, 60, 90, 120, 180, 270, 365, 550, 730."
  type        = number
  default     = 90
}

variable "daily_data_cap_in_gb" {
  description = "Daily data volume cap in GB."
  type        = number
  default     = 100
}

variable "daily_data_cap_notifications_enabled" {
  description = "Whether email notifications are sent when the daily cap is reached."
  type        = bool
  default     = true
}

variable "sampling_percentage" {
  description = "Percentage of data to sample (0-100)."
  type        = number
  default     = 100
}

variable "ip_masking_enabled" {
  description = "Whether IP masking is enabled."
  type        = bool
  default     = true
}

variable "local_authentication_enabled" {
  description = "Whether local authentication is enabled."
  type        = bool
  default     = true
}

variable "internet_ingestion_enabled" {
  description = "Whether data ingestion over the public internet is enabled."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Whether data querying over the public internet is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to Application Insights."
  type        = map(string)
  default     = {}
}
