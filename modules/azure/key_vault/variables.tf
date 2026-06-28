# ===========================================
# Variables : Azurerm Key Vault
# (require)
# - name
# - resource_group_name
# (optional)
# - tenant_id
# - sku_name
# - enable_rbac_authorization
# - purge_protection_enabled
# - soft_delete_retention_days
# - public_network_access_enabled
# - network_acls (object)
# - access_policies (list)
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
}
variable "tenant_id" {
  type        = string
  description = "(Optional) The Azure Active Directory tenant ID used for authenticating requests to the Key Vault. Defaults to the tenant of the configured provider when not set."
  default     = null
}
variable "sku_name" {
  type        = string
  description = "(Optional) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  default     = "standard"
}
variable "enable_rbac_authorization" {
  type        = bool
  description = "(Optional) Whether Azure Active Directory RBAC should be used for authorization of data actions instead of access policies."
  default     = true
}
variable "purge_protection_enabled" {
  type        = bool
  description = "(Optional) Whether purge protection is enabled for this Key Vault."
  default     = true
}
variable "soft_delete_retention_days" {
  type        = number
  description = "(Optional) The number of days that items should be retained for once soft-deleted. Valid values are between 7 and 90."
  default     = 90
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this Key Vault."
  default     = true
}
variable "network_acls" {
  description = "(Optional) Network ACL configuration for the Key Vault. Leave as null to skip configuring network ACLs."
  type = object({
    bypass                     = string
    default_action              = string
    ip_rules                    = optional(list(string), [])
    virtual_network_subnet_ids  = optional(list(string), [])
  })
  default = null
}
variable "access_policies" {
  description = "(Optional) List of access_policy. Ignored when enable_rbac_authorization is true."
  type = list(object({
    tenant_id               = optional(string)
    object_id               = string
    key_permissions          = optional(list(string), [])
    secret_permissions       = optional(list(string), [])
    certificate_permissions  = optional(list(string), [])
  }))
  default = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
