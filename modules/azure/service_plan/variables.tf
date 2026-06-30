# ===========================================
# Variables : Azurerm Service Plan
# ===========================================
# Required
# - name
# - resource_group_name
# - os_type
# - sku_name
#
# Optional
# - app_service_environment_id
# - worker_count
# - maximum_elastic_worker_count
# - per_site_scaling_enabled
# - premium_plan_auto_scale_enabled
# - zone_balancing_enabled
# - tags

variable "name" {
  description = "Name of the Service Plan."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group to create the Service Plan in."
  type        = string
}

variable "os_type" {
  description = "OS type for the Service Plan. One of: Windows, Linux, WindowsContainer."
  type        = string

  validation {
    condition     = contains(["Windows", "Linux", "WindowsContainer"], var.os_type)
    error_message = "os_type must be one of: Windows, Linux, WindowsContainer."
  }
}

variable "sku_name" {
  description = "SKU name for the Service Plan (e.g. B1, P1v3, Y1, EP1)."
  type        = string
}

variable "app_service_environment_id" {
  description = "ID of the App Service Environment to deploy the Service Plan into (requires Isolated SKU)."
  type        = string
  default     = null
}

variable "worker_count" {
  description = "Number of Workers to allocate to the Service Plan."
  type        = number
  default     = null
}

variable "maximum_elastic_worker_count" {
  description = "Maximum number of workers for Elastic/Premium plans."
  type        = number
  default     = null
}

variable "per_site_scaling_enabled" {
  description = "Whether per-site scaling is enabled."
  type        = bool
  default     = false
}

variable "premium_plan_auto_scale_enabled" {
  description = "Whether auto-scaling is enabled for Premium SKU plans."
  type        = bool
  default     = false
}

variable "zone_balancing_enabled" {
  description = "Whether to distribute workers across availability zones."
  type        = bool
  default     = null
}

variable "tags" {
  description = "Tags to apply to the Service Plan."
  type        = map(string)
  default     = {}
}
