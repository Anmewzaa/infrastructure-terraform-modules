# ===========================================
# Variables : Azurerm Key Vault Secret
# (require)
# - name
# - key_vault_id
# - value
# (optional)
# - content_type
# - not_before_date
# - expiration_date
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Key Vault Secret. Changing this forces a new resource to be created."
}
variable "key_vault_id" {
  type        = string
  description = "(Required) The ID of the Key Vault where the Secret should be created. Changing this forces a new resource to be created."
}
variable "value" {
  type        = string
  description = "(Required) The value of the Key Vault Secret."
  sensitive   = true
}
variable "content_type" {
  type        = string
  description = "(Optional) Specifies the content type for the Key Vault Secret."
  default     = null
}
variable "not_before_date" {
  type        = string
  description = "(Optional) Key not usable before the provided UTC datetime (RFC3339)."
  default     = null
}
variable "expiration_date" {
  type        = string
  description = "(Optional) Expiration UTC datetime (RFC3339)."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
