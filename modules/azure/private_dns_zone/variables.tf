# =========================================== 
# Variables : Azurerm Private DNS Zone
# (require) 
# - name
# - resource_group_name
# (optional)
# - tags
# =========================================== 
variable "name" {
  type        = string
  description = "(Required) The name of the Private DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the resource group where the resource exists. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
