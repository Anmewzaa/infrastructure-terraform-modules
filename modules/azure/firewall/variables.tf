# ===========================================
# Variables : Azurerm Firewall
# (require)
# - name
# - resource_group_name
# - ip_configurations
# (optional)
# - sku_name
# - sku_tier
# - firewall_policy_id
# - threat_intel_mode
# - zones
# - management_ip_configuration
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Firewall. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "sku_name" {
  type        = string
  description = "(Optional) The SKU name: AZFW_Hub or AZFW_VNet."
  default     = "AZFW_VNet"
}
variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU tier: Basic, Standard or Premium."
  default     = "Standard"
}
variable "firewall_policy_id" {
  type        = string
  description = "(Optional) The ID of a Firewall Policy to associate."
  default     = null
}
variable "threat_intel_mode" {
  type        = string
  description = "(Optional) The threat intelligence mode: Off, Alert or Deny. Ignored (null) when a firewall policy is set."
  default     = "Alert"
}
variable "zones" {
  type        = list(string)
  description = "(Optional) A list of availability zones."
  default     = null
}
variable "ip_configurations" {
  type        = list(object({ name = string, subnet_id = optional(string), public_ip_address_id = string }))
  description = "(Required) IP configurations. The first entry must set subnet_id (AzureFirewallSubnet); additional entries only a public IP."
}
variable "management_ip_configuration" {
  type        = object({ name = string, subnet_id = string, public_ip_address_id = string })
  description = "(Optional) Management IP configuration (AzureFirewallManagementSubnet). Required for the Basic tier."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
