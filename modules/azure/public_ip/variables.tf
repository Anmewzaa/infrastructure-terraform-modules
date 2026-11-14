# ===========================================
# Variables : Azurerm Public IP
# (require)
# - name
# - resource_group_name
# (optional)
# - allocation_method
# - sku
# - sku_tier
# - ip_version
# - zones
# - domain_name_label
# - idle_timeout_in_minutes
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the public IP. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "allocation_method" {
  type        = string
  description = "(Optional) Defines the allocation method: Static or Dynamic. Standard SKU requires Static."
  default     = "Static"
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP: Basic or Standard."
  default     = "Standard"
}
variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU tier: Regional or Global."
  default     = "Regional"
}
variable "ip_version" {
  type        = string
  description = "(Optional) The IP version to use: IPv4 or IPv6."
  default     = "IPv4"
}
variable "zones" {
  type        = list(string)
  description = "(Optional) A list of availability zones. Standard SKU only."
  default     = null
}
variable "domain_name_label" {
  type        = string
  description = "(Optional) Label for the Domain Name, used to generate an FQDN."
  default     = null
}
variable "idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Idle timeout in minutes for the Public IP (4-30)."
  default     = 4
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
