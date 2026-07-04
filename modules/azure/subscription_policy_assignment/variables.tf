# ===========================================
# Variables : Azurerm Subscription Policy Assignment
# (require)
# - name
# - policy_definition_id
# - subscription_id
# (optional)
# - description
# - display_name
# - enforce
# - location
# - parameters
# - identity_type
# - identity_ids
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name which should be used for this Policy Assignment. Changing this forces a new Policy Assignment to be created."
}
variable "policy_definition_id" {
  type        = string
  description = "(Required) The ID of the Policy Definition or Policy Definition Set."
}
variable "subscription_id" {
  type        = string
  description = "(Required) The ID of the Subscription where this Policy Assignment should be created. Changing this forces a new Policy Assignment to be created."
}
variable "description" {
  type        = string
  description = "(Optional) A description which should be used for this Policy Assignment."
  default     = null
}
variable "display_name" {
  type        = string
  description = "(Optional) The Display Name for this Policy Assignment."
  default     = null
}
variable "enforce" {
  type        = bool
  description = "(Optional) Specifies if this Policy should be enforced or not."
  default     = true
}
variable "location" {
  type        = string
  description = "(Optional) The Azure Region where the Policy Assignment should exist. Required when an Identity is specified."
  default     = null
}
variable "parameters" {
  type        = string
  description = "(Optional) A JSON mapping of any Parameters for this Policy."
  default     = null
}
variable "identity_type" {
  type        = string
  description = "(Optional) The Type of Managed Identity which should be added to this Policy Definition. Possible values are SystemAssigned and UserAssigned. Set to null to disable."
  default     = null
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Managed Identity IDs which should be assigned to the Policy Definition."
  default     = []
}
