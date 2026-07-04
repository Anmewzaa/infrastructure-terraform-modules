# ===========================================
# Variables : Azurerm Eventhub Namespace
# (require)
# - name
# - resource_group_name
# - sku
# (optional)
# - capacity
# - auto_inflate_enabled
# - maximum_throughput_units
# - minimum_tls_version
# - public_network_access_enabled
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the EventHub Namespace. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the EventHub Namespace. Changing this forces a new resource to be created."
}
variable "sku" {
  type        = string
  description = "(Required) Defines which tier to use. Valid options are Basic, Standard, and Premium."
}
variable "capacity" {
  type        = number
  description = "(Optional) Specifies the Capacity / Throughput Units for a Standard SKU namespace."
  default     = 1
}
variable "auto_inflate_enabled" {
  type        = bool
  description = "(Optional) Is Auto Inflate enabled for the EventHub Namespace?"
  default     = false
}
variable "maximum_throughput_units" {
  type        = number
  description = "(Optional) Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20."
  default     = null
}
variable "minimum_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for this EventHub Namespace. Valid values are 1.0, 1.1 and 1.2."
  default     = "1.2"
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Is public network access enabled for the EventHub Namespace?"
  default     = true
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
