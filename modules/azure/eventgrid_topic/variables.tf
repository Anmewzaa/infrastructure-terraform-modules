# ===========================================
# Variables : Azurerm Event Grid Topic
# (require)
# - name
# - resource_group_name
# (optional)
# - input_schema
# - local_auth_enabled
# - public_network_access_enabled
# - identity_type
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Event Grid Topic. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "input_schema" {
  type        = string
  description = "(Optional) The schema of incoming events: EventGridSchema, CloudEventSchemaV1_0 or CustomEventSchema."
  default     = "EventGridSchema"
}
variable "local_auth_enabled" {
  type        = bool
  description = "(Optional) Whether local (key based) authentication is enabled."
  default     = true
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed."
  default     = true
}
variable "identity_type" {
  type        = string
  description = "(Optional) The type of Managed Identity: SystemAssigned, UserAssigned or 'SystemAssigned, UserAssigned'. Leave null for no identity."
  default     = null
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Managed Identity IDs. Used when identity_type includes UserAssigned."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
