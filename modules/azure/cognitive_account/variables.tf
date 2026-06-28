# ===========================================
# Variables : Azurerm Cognitive Account
# (require)
# - name
# - resource_group_name
# - kind
# (optional)
# - sku_name
# - custom_subdomain_name
# - public_network_access_enabled
# - identity_type
# - identity_ids (list)
# - network_acls (object)
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Cognitive Services Account. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Cognitive Services Account. Changing this forces a new resource to be created."
}
variable "kind" {
  type        = string
  description = "(Required) Specifies the type of Cognitive Service Account, such as OpenAI, CognitiveServices, ComputerVision or TextAnalytics."
}
variable "sku_name" {
  type        = string
  description = "(Optional) Specifies the SKU Name for this Cognitive Service Account, such as F0 or S0."
  default     = "S0"
}
variable "custom_subdomain_name" {
  type        = string
  description = "(Optional) The subdomain name used for token-based authentication. Required for some kinds, such as OpenAI."
  default     = null
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this Cognitive Services Account."
  default     = true
}
variable "identity_type" {
  type        = string
  description = "(Optional) The type of Managed Identity for this Cognitive Services Account. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned. Set to null to disable."
  default     = "SystemAssigned"
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Identity IDs to be assigned to this Cognitive Services Account. Required when identity_type includes UserAssigned."
  default     = []
}
variable "network_acls" {
  description = "(Optional) Network ACL configuration for the Cognitive Services Account. Leave as null to skip configuring network ACLs."
  type = object({
    default_action              = string
    ip_rules                    = optional(list(string), [])
    virtual_network_subnet_ids  = optional(list(string), [])
  })
  default = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
