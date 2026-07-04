# ===========================================
# Variables : Azurerm Monitor Action Group
# (require)
# - name
# - resource_group_name
# - short_name
# (optional)
# - email_receivers
# - sms_receivers
# - webhook_receivers
# - enabled
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Action Group. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Action Group instance. Changing this forces a new resource to be created."
}
variable "short_name" {
  type        = string
  description = "(Required) The short name of the action group. This will be used in SMS messages."
}
variable "email_receivers" {
  type = list(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = optional(bool, true)
  }))
  description = "(Optional) One or more email_receiver blocks."
  default     = []
}
variable "sms_receivers" {
  type = list(object({
    name         = string
    country_code = string
    phone_number = string
  }))
  description = "(Optional) One or more sms_receiver blocks."
  default     = []
}
variable "webhook_receivers" {
  type = list(object({
    name        = string
    service_uri = string
  }))
  description = "(Optional) One or more webhook_receiver blocks."
  default     = []
}
variable "enabled" {
  type        = bool
  description = "(Optional) Whether this action group is enabled. If an action group is not enabled, then none of its receivers will receive communications."
  default     = true
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
