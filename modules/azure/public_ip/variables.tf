# ===========================================
# Variables : Azurerm Public IP
# (require)
# - name
# - resource_group_name
# - allocation_method
# (optional)
# - sku
# - ip_version
# - idle_timeout_in_minutes
# - domain_name_label
# - zones
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Public IP. Changing this forces a new Public IP to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group where this Public IP should exist. Changing this forces a new Public IP to be created."
}
variable "allocation_method" {
  type        = string
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard."
  default     = "Standard"
}
variable "ip_version" {
  type        = string
  description = "(Optional) The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created."
  default     = "IPv4"
}
variable "idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  default     = null
}
variable "domain_name_label" {
  type        = string
  description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN."
  default     = null
}
variable "zones" {
  type        = list(string)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
