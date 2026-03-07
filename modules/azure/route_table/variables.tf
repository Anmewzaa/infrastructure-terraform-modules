# =========================================== 
# Variables : Azurerm Route Table 
# (require) 
# - name
# - resource_group_name
# - routes (list)
# (optional)
# - tags
# =========================================== 
variable "name" {
  type        = string
  description = "(Required) The name of the route table. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the route table. Changing this forces a new resource to be created."
}
variable "routes" {
  description = "List of route"
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string
  }))
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
