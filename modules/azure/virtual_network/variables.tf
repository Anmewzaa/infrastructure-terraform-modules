# =========================================== 
# Variables : Azurerm Virtual Network     
# (require) 
# - name
# - resource_group_name
# - address_space
# - subnets (list)
# (optional)
# - tags
# =========================================== 
variable "name" {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}
variable "address_space" {
  type        = list(string)
  description = "(Optional) The address space that is used the virtual network. You can supply more than one address space."
}
variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    security_group   = optional(string)
    route_table_id   = optional(string)
  }))
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
variable "dns_servers" {
  description = "List of DNS servers to use for the virtual network."
  type        = list(string)
  default     = []
}
