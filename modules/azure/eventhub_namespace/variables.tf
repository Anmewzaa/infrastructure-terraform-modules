# ===========================================
# Variables : Azurerm Event Hub Namespace
# (require)
# - name
# - resource_group_name
# (optional)
# - sku
# - capacity
# - auto_inflate_enabled
# - maximum_throughput_units
# - local_authentication_enabled
# - public_network_access_enabled
# - minimum_tls_version
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Event Hub namespace (globally unique). Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU: Basic, Standard or Premium. Private endpoints require Standard or higher."
  default     = "Standard"
}
variable "capacity" {
  type        = number
  description = "(Optional) Specifies the capacity (throughput units for Standard, processing units for Premium)."
  default     = 1
}
variable "auto_inflate_enabled" {
  type        = bool
  description = "(Optional) Is auto inflate enabled? Standard only."
  default     = false
}
variable "maximum_throughput_units" {
  type        = number
  description = "(Optional) Upper limit of throughput units when auto inflate is enabled (1-40)."
  default     = null
}
variable "local_authentication_enabled" {
  type        = bool
  description = "(Optional) Whether SAS authentication is enabled."
  default     = true
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed."
  default     = true
}
variable "minimum_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version."
  default     = "1.2"
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
