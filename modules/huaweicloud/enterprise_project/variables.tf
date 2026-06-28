# ===========================================
# Variables : Huaweicloud Enterprise Project
# (require)
# - name
# (optional)
# - description
# - type
# - enable
# - skip_disable_on_destroy
# - delete_flag
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the enterprise project. Must be unique within the domain and cannot contain \"default\" or its variants."
}
variable "description" {
  type        = string
  description = "(Optional) The description of the enterprise project."
  default     = ""
}
variable "type" {
  type        = string
  description = "(Optional) The type of the enterprise project. Possible values are poc and prod."
  default     = "prod"

  validation {
    condition     = contains(["poc", "prod"], var.type)
    error_message = "type must be either \"poc\" or \"prod\"."
  }
}
variable "enable" {
  type        = bool
  description = "(Optional) Whether to enable the enterprise project. Note that a poc project cannot be disabled."
  default     = true
}
variable "skip_disable_on_destroy" {
  type        = bool
  description = "(Optional) Whether to skip disabling the enterprise project when the resource is destroyed."
  default     = false
}
variable "delete_flag" {
  type        = bool
  description = "(Optional) Whether to remove the enterprise project when the resource is destroyed."
  default     = false
}
