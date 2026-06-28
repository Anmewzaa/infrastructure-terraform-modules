# ===========================================
# Variables : Azurerm Role Assignment
# (require)
# - scope
# - principal_id
# - role_definition_name or role_definition_id
# (optional)
# - skip_service_principal_aad_check
# ===========================================
variable "scope" {
  type        = string
  description = "(Required) The scope at which the Role Assignment applies to, such as a subscription, resource group or resource ID."
}
variable "role_definition_name" {
  type        = string
  description = "(Optional) The name of a built-in Role. Conflicts with role_definition_id. Changing this forces a new resource to be created."
  default     = null
}
variable "role_definition_id" {
  type        = string
  description = "(Optional) The Scoped-ID of the Role Definition. Conflicts with role_definition_name. Changing this forces a new resource to be created."
  default     = null
}
variable "principal_id" {
  type        = string
  description = "(Required) The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
}
variable "skip_service_principal_aad_check" {
  type        = bool
  description = "(Optional) If the principal_id is a Service Principal, skip the Azure Active Directory check to confirm that it exists."
  default     = false
}
