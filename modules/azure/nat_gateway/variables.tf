# ===========================================
# Variables : Azurerm NAT Gateway
# (require)
# - name
# - resource_group_name
# (optional)
# - sku_name
# - idle_timeout_in_minutes
# - zones
# - public_ip_ids
# - subnet_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the NAT Gateway. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "sku_name" {
  type        = string
  description = "(Optional) The SKU of the NAT Gateway. Currently only Standard."
  default     = "Standard"
}
variable "idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Idle timeout in minutes (4-120)."
  default     = 4
}
variable "zones" {
  type        = list(string)
  description = "(Optional) A list of availability zones where the NAT Gateway can be provisioned."
  default     = null
}
variable "public_ip_ids" {
  type        = list(string)
  description = "(Optional) A list of Public IP (Standard, Static) IDs to associate with the NAT Gateway."
  default     = []
}
variable "subnet_ids" {
  type        = list(string)
  description = "(Optional) A list of Subnet IDs to associate with the NAT Gateway."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
