# ===========================================
# Variables : Azurerm Eventhub
# (require)
# - name
# - namespace_id
# - partition_count
# - message_retention
# (optional)
# - status
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the EventHub. Changing this forces a new resource to be created."
}
variable "namespace_id" {
  type        = string
  description = "(Required) The ID of the EventHub Namespace to create this EventHub within."
}
variable "partition_count" {
  type        = number
  description = "(Required) Specifies the current number of shards on the Event Hub."
}
variable "message_retention" {
  type        = number
  description = "(Required) Specifies the number of days to retain the events for this Event Hub."
}
variable "status" {
  type        = string
  description = "(Optional) Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled."
  default     = "Active"
}
