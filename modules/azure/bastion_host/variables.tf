# ===========================================
# Variables : Azurerm Bastion Host
# (require)
# - name
# - resource_group_name
# - subnet_id
# - public_ip_address_id
# (optional)
# - sku
# - scale_units
# - copy_paste_enabled
# - file_copy_enabled
# - ip_connect_enabled
# - shareable_link_enabled
# - tunneling_enabled
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Bastion Host. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the AzureBastionSubnet (/26 or larger)."
}
variable "public_ip_address_id" {
  type        = string
  description = "(Required) The ID of the Standard/Static Public IP for the Bastion Host."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU: Basic, Standard or Premium."
  default     = "Basic"
}
variable "scale_units" {
  type        = number
  description = "(Optional) The number of scale units (2-50). Must be 2 for Basic."
  default     = 2
}
variable "copy_paste_enabled" {
  type        = bool
  description = "(Optional) Is copy/paste feature enabled?"
  default     = true
}
variable "file_copy_enabled" {
  type        = bool
  description = "(Optional) Is file copy feature enabled? Standard/Premium only."
  default     = false
}
variable "ip_connect_enabled" {
  type        = bool
  description = "(Optional) Is IP Connect feature enabled? Standard/Premium only."
  default     = false
}
variable "shareable_link_enabled" {
  type        = bool
  description = "(Optional) Is Shareable Link feature enabled? Standard/Premium only."
  default     = false
}
variable "tunneling_enabled" {
  type        = bool
  description = "(Optional) Is Tunneling feature enabled? Standard/Premium only."
  default     = false
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
