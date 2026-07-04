# ===========================================
# Variables : Azurerm Load Balancer
# (require)
# - name
# - resource_group_name
# - frontend_ip_configurations
# (optional)
# - sku
# - sku_tier
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Load Balancer. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which to create the Load Balancer. Changing this forces a new resource to be created."
}
variable "frontend_ip_configurations" {
  type = list(object({
    name                          = string
    public_ip_address_id          = optional(string)
    subnet_id                     = optional(string)
    private_ip_address            = optional(string)
    private_ip_address_allocation = optional(string, "Dynamic")
    zones                         = optional(list(string))
  }))
  description = "(Required) A list of frontend IP configuration blocks for the Load Balancer."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway."
  default     = "Standard"
}
variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU tier of this Load Balancer. Possible values are Global and Regional."
  default     = "Regional"
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
