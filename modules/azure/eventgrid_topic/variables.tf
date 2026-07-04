# ===========================================
# Variables : Azurerm Eventgrid Topic
# (require)
# - name
# - resource_group_name
# (optional)
# - input_schema
# - public_network_access_enabled
# - local_auth_enabled
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the EventGrid Topic. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the EventGrid Topic exists. Changing this forces a new resource to be created."
}
variable "input_schema" {
  type        = string
  description = "(Optional) Specifies the schema in which incoming events will be published to this domain. Allowed values are CloudEventSchemaV1_0, CustomEventSchema, or EventGridSchema."
  default     = "EventGridSchema"
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether or not public network access is allowed for this server."
  default     = true
}
variable "local_auth_enabled" {
  type        = bool
  description = "(Optional) Whether local authentication methods is enabled for the EventGrid Topic."
  default     = true
}
variable "identity_type" {
  type        = string
  description = "(Optional) Specifies the type of Managed Service Identity. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned. Set to null to disable."
  default     = null
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Managed Identity IDs to be assigned to this EventGrid Topic."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
