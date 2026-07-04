# ===========================================
# Variables : Azurerm Monitor Metric Alert
# (require)
# - name
# - resource_group_name
# - scopes
# - criteria
# (optional)
# - description
# - enabled
# - severity
# - frequency
# - window_size
# - actions
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Metric Alert. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Metric Alert instance. Changing this forces a new resource to be created."
}
variable "scopes" {
  type        = list(string)
  description = "(Required) A set of strings of resource IDs at which the metric criteria should be applied."
}
variable "criteria" {
  type = list(object({
    metric_namespace = string
    metric_name      = string
    aggregation      = string
    operator         = string
    threshold        = number
  }))
  description = "(Required) One or more criteria blocks defining the metric alert criteria."
}
variable "description" {
  type        = string
  description = "(Optional) The description of this Metric Alert."
  default     = null
}
variable "enabled" {
  type        = bool
  description = "(Optional) Should this Metric Alert be enabled?"
  default     = true
}
variable "severity" {
  type        = number
  description = "(Optional) The severity of this Metric Alert. Possible values are 0, 1, 2, 3 and 4."
  default     = 3
}
variable "frequency" {
  type        = string
  description = "(Optional) The evaluation frequency of this Metric Alert. Possible values are PT1M, PT5M, PT15M, PT30M and PT1H."
  default     = "PT1M"
}
variable "window_size" {
  type        = string
  description = "(Optional) The period of time that is used to monitor alert activity. Possible values are PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H and P1D."
  default     = "PT5M"
}
variable "actions" {
  type = list(object({
    action_group_id    = string
    webhook_properties = optional(map(string))
  }))
  description = "(Optional) One or more action blocks."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
