# ===========================================
# Variables : Azurerm Container Registry
# ===========================================
# Required
# - name
# - resource_group_name
# - sku
#
# Optional
# - admin_enabled
# - public_network_access_enabled
# - anonymous_pull_enabled
# - network_rule_bypass_option
# - quarantine_policy_enabled
# - retention_policy_in_days
# - trust_policy_enabled
# - zone_redundancy_enabled
# - export_policy_enabled
# - data_endpoint_enabled
# - identity_type
# - identity_ids
# - georeplications
# - tags

variable "name" {
  description = "Name of the Container Registry (alphanumeric only)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the Container Registry in."
  type        = string
}

variable "sku" {
  description = "SKU tier of the Container Registry. One of: Basic, Standard, Premium."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be one of: Basic, Standard, Premium."
  }
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed."
  type        = bool
  default     = true
}

variable "anonymous_pull_enabled" {
  description = "Whether anonymous pulls are enabled (Standard/Premium only)."
  type        = bool
  default     = false
}

variable "network_rule_bypass_option" {
  description = "Whether trusted Azure services can bypass network rules. One of: None, AzureServices."
  type        = string
  default     = "AzureServices"
}

variable "quarantine_policy_enabled" {
  description = "Whether the quarantine policy is enabled (Premium only)."
  type        = bool
  default     = null
}

variable "retention_policy_in_days" {
  description = "Days to retain untagged manifests (Premium only)."
  type        = number
  default     = null
}

variable "trust_policy_enabled" {
  description = "Whether content trust is enabled (Premium only)."
  type        = bool
  default     = false
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled (Premium only)."
  type        = bool
  default     = false
}

variable "export_policy_enabled" {
  description = "Whether the export policy is enabled (Premium only)."
  type        = bool
  default     = true
}

variable "data_endpoint_enabled" {
  description = "Whether dedicated data endpoints are enabled (Premium only)."
  type        = bool
  default     = false
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

variable "georeplications" {
  description = "List of geo-replication configurations (Premium only)."
  type = list(object({
    location                  = string
    regional_endpoint_enabled = optional(bool)
    zone_redundancy_enabled   = optional(bool)
    tags                      = optional(map(string))
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the Container Registry."
  type        = map(string)
  default     = {}
}
