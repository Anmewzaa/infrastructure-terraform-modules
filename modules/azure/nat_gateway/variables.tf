# ===========================================
# Variables : Azurerm NAT Gateway
# (require)
# - name
# - resource_group_name
# (optional)
# - sku_name
# - idle_timeout_in_minutes
# - zones
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the NAT Gateway. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which the NAT Gateway should exist. Changing this forces a new resource to be created."
}
variable "sku_name" {
  type        = string
  description = "(Optional) The SKU which should be used. At this time the only supported value is Standard."
  default     = "Standard"
}
variable "idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) The idle timeout which should be used in minutes. Defaults to 4."
  default     = 4
}
variable "zones" {
  type        = list(string)
  description = "(Optional) A list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
