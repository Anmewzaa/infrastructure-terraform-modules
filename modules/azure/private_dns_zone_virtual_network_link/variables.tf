# ===========================================
# Variables : Azurerm Private DNS Zone Virtual Network Link
# (require)
# - name
# - resource_group_name
# - private_dns_zone_name
# - virtual_network_id
# (optional)
# - registration_enabled
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the virtual network link. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "private_dns_zone_name" {
  type        = string
  description = "(Required) The name of the Private DNS Zone (must be a valid domain name). Changing this forces a new resource to be created."
}
variable "virtual_network_id" {
  type        = string
  description = "(Required) The ID of the Virtual Network that should be linked to the DNS Zone."
}
variable "registration_enabled" {
  type        = bool
  description = "(Optional) Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
  default     = false
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
