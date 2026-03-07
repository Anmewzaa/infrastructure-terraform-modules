# =========================================== 
# Variables : Azurerm Network Security Group  
# (require) 
# - name
# - resource_group_name
# - security_rules (list)
# (optional)
# - tags
# =========================================== 
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
}
variable "security_rules" {
  description = "List of security_rule"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
