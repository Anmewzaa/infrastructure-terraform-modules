# ===========================================
# Variables : Azurerm Service Bus Namespace
# (require)
# - name
# - resource_group_name
# (optional)
# - sku
# - capacity
# - premium_messaging_partitions
# - local_auth_enabled
# - public_network_access_enabled
# - minimum_tls_version
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Service Bus namespace (globally unique). Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU: Basic, Standard or Premium. Private endpoints require Premium."
  default     = "Standard"
}
variable "capacity" {
  type        = number
  description = "(Optional) Messaging units for a Premium namespace (1, 2, 4, 8 or 16). Must be 0 for Basic/Standard."
  default     = 0
}
variable "premium_messaging_partitions" {
  type        = number
  description = "(Optional) Number of messaging partitions for Premium (1, 2 or 4). Must be 0 for Basic/Standard."
  default     = 0
}
variable "local_auth_enabled" {
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
