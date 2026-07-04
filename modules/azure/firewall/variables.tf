# ===========================================
# Variables : Azurerm Firewall
# (require)
# - name
# - resource_group_name
# - sku_name
# - sku_tier
# (optional)
# - firewall_policy_id
# - dns_servers
# - threat_intel_mode
# - ip_configurations
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Firewall. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "sku_name" {
  type        = string
  description = "(Required) SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet."
}
variable "sku_tier" {
  type        = string
  description = "(Required) SKU tier of the Firewall. Possible values are Premium, Standard, and Basic."
}
variable "firewall_policy_id" {
  type        = string
  description = "(Optional) The ID of the Firewall Policy applied to this Firewall."
  default     = null
}
variable "dns_servers" {
  type        = list(string)
  description = "(Optional) A list of DNS servers that the Azure Firewall will direct DNS traffic to for name resolution."
  default     = null
}
variable "threat_intel_mode" {
  type        = string
  description = "(Optional) The operation mode for threat intelligence-based filtering. Possible values are Off, Alert and Deny."
  default     = "Alert"
}
variable "ip_configurations" {
  type = list(object({
    name                 = string
    subnet_id            = optional(string)
    public_ip_address_id = optional(string)
  }))
  description = "(Optional) A list of ip_configuration blocks for the Firewall."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
