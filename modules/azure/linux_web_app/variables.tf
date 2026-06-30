# ===========================================
# Variables : Azurerm Linux Web App
# ===========================================
# Required
# - name
# - resource_group_name
# - service_plan_id
#
# Optional
# - https_only
# - enabled
# - app_settings
# - always_on
# - minimum_tls_version
# - http2_enabled
# - ftps_state
# - application_stack
# - identity_type
# - identity_ids
# - connection_strings
# - tags

variable "name" {
  description = "Name of the Linux Web App."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the Linux Web App in."
  type        = string
}

variable "service_plan_id" {
  description = "ID of the Service Plan to host the Linux Web App."
  type        = string
}

variable "https_only" {
  description = "Whether to redirect all HTTP traffic to HTTPS."
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Whether the Linux Web App is enabled."
  type        = bool
  default     = true
}

variable "app_settings" {
  description = "Key-value pairs of application settings."
  type        = map(string)
  default     = {}
}

variable "always_on" {
  description = "Whether the web app is always loaded. Must be false for Free/Shared SKU plans."
  type        = bool
  default     = true
}

variable "minimum_tls_version" {
  description = "Minimum TLS version for the web app."
  type        = string
  default     = "1.2"
}

variable "http2_enabled" {
  description = "Whether HTTP/2 is enabled."
  type        = bool
  default     = false
}

variable "ftps_state" {
  description = "State of FTP/FTPS. One of: AllAllowed, FtpsOnly, Disabled."
  type        = string
  default     = "Disabled"

  validation {
    condition     = contains(["AllAllowed", "FtpsOnly", "Disabled"], var.ftps_state)
    error_message = "ftps_state must be one of: AllAllowed, FtpsOnly, Disabled."
  }
}

variable "application_stack" {
  description = "Runtime application stack configuration. Specify one runtime key (e.g. node_version, python_version, dotnet_version, docker_image_name)."
  type        = map(string)
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

variable "connection_strings" {
  description = "List of connection string blocks."
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the Linux Web App."
  type        = map(string)
  default     = {}
}
