# ===========================================
# Variables : Azurerm Servicebus Namespace
# (require)
# - name
# - resource_group_name
# - sku
# (optional)
# - capacity
# - local_auth_enabled
# - public_network_access_enabled
# - minimum_tls_version
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Service Bus Namespace. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Service Bus Namespace. Changing this forces a new resource to be created."
}
variable "sku" {
  type        = string
  description = "(Required) Defines which tier to use. Options are Basic, Standard or Premium."
}
variable "capacity" {
  type        = number
  description = "(Optional) Specifies the capacity. When SKU is Premium, allowed values are 1, 2, 4, 8 or 16. When SKU is Basic or Standard, capacity must be 0."
  default     = null
}
variable "local_auth_enabled" {
  type        = bool
  description = "(Optional) Whether or not SAS authentication is enabled for the Service Bus namespace."
  default     = true
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Is public network access enabled for the Service Bus Namespace?"
  default     = true
}
variable "minimum_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for this Service Bus Namespace. Valid values are 1.0, 1.1 and 1.2."
  default     = "1.2"
}
variable "identity_type" {
  type        = string
  description = "(Optional) Specifies the type of Managed Service Identity. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned. Set to null to disable."
  default     = null
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Managed Identity IDs to be assigned to this Service Bus Namespace."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
