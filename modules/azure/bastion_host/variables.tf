# ===========================================
# Variables : Azurerm Bastion Host
# (require)
# - name
# - resource_group_name
# (optional)
# - sku
# - copy_paste_enabled
# - scale_units
# - ip_configuration
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Bastion Host. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Bastion Host. Changing this forces a new resource to be created."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Bastion Host. Accepted values are Developer, Basic, Standard and Premium."
  default     = "Basic"
}
variable "copy_paste_enabled" {
  type        = bool
  description = "(Optional) Is Copy/Paste feature enabled for the Bastion Host."
  default     = true
}
variable "scale_units" {
  type        = number
  description = "(Optional) The number of scale units with which to provision the Bastion Host. Possible values are between 2 and 50."
  default     = 2
}
variable "ip_configuration" {
  type = object({
    name                 = string
    subnet_id            = string
    public_ip_address_id = string
  })
  description = "(Optional) A ip_configuration block for the Bastion Host. Set to null to skip."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
