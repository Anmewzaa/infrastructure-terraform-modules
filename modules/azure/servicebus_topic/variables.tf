# ===========================================
# Variables : Azurerm Servicebus Topic
# (require)
# - name
# - namespace_id
# (optional)
# - status
# - partitioning_enabled
# - max_size_in_megabytes
# - default_message_ttl
# - support_ordering
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Service Bus Topic. Changing this forces a new resource to be created."
}
variable "namespace_id" {
  type        = string
  description = "(Required) The ID of the Service Bus Namespace to create this topic in."
}
variable "status" {
  type        = string
  description = "(Optional) The status of the Service Bus Topic. Acceptable values are Active or Disabled."
  default     = "Active"
}
variable "partitioning_enabled" {
  type        = bool
  description = "(Optional) Boolean flag which controls whether to enable the topic to be partitioned across multiple message brokers. Changing this forces a new resource to be created."
  default     = false
}
variable "max_size_in_megabytes" {
  type        = number
  description = "(Optional) Integer value which controls the size of memory allocated for the topic."
  default     = 5120
}
variable "default_message_ttl" {
  type        = string
  description = "(Optional) The ISO 8601 timespan duration of the TTL of messages sent to this topic if no TTL value is set on the message itself."
  default     = null
}
variable "support_ordering" {
  type        = bool
  description = "(Optional) Boolean flag which controls whether the Topic supports ordering."
  default     = false
}
