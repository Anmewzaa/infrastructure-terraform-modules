# ===========================================
# Variables : Azurerm Servicebus Queue
# (require)
# - name
# - namespace_id
# (optional)
# - lock_duration
# - max_size_in_megabytes
# - requires_session
# - dead_lettering_on_message_expiration
# - max_delivery_count
# - partitioning_enabled
# - status
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Service Bus Queue. Changing this forces a new resource to be created."
}
variable "namespace_id" {
  type        = string
  description = "(Required) The ID of the Service Bus Namespace to create this queue in."
}
variable "lock_duration" {
  type        = string
  description = "(Optional) The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers."
  default     = "PT1M"
}
variable "max_size_in_megabytes" {
  type        = number
  description = "(Optional) Integer value which controls the size of memory allocated for the queue. For supported values see the Queue or Topic tab in https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quotas."
  default     = null
}
variable "requires_session" {
  type        = bool
  description = "(Optional) Boolean flag which controls whether the Queue requires sessions. Changing this forces a new resource to be created."
  default     = false
}
variable "dead_lettering_on_message_expiration" {
  type        = bool
  description = "(Optional) Boolean flag which controls whether the Queue has dead letter support when a message expires."
  default     = false
}
variable "max_delivery_count" {
  type        = number
  description = "(Optional) Integer value which controls when a message is automatically dead lettered."
  default     = 10
}
variable "partitioning_enabled" {
  type        = bool
  description = "(Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created."
  default     = false
}
variable "status" {
  type        = string
  description = "(Optional) The status of the Queue. Possible values are Active, Creating, Deleting, Disabled, ReceiveDisabled, Renaming, SendDisabled, Unknown."
  default     = "Active"
}
