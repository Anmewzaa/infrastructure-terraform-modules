# ===========================================
# Variables : Google Compute Firewall
# ===========================================
# Required
# - name
# - network
#
# Optional
# - project
# - description
# - direction
# - priority
# - disabled
# - source_ranges
# - destination_ranges
# - source_tags
# - target_tags
# - source_service_accounts
# - target_service_accounts
# - allow
# - deny
# - log_config_metadata

variable "name" {
  description = "Name of the firewall rule."
  type        = string
}

variable "network" {
  description = "Self link or name of the network to attach the firewall rule to."
  type        = string
}

variable "project" {
  description = "Project ID to create the firewall rule in."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the firewall rule."
  type        = string
  default     = null
}

variable "direction" {
  description = "Direction of traffic to which the firewall applies. Either INGRESS or EGRESS."
  type        = string
  default     = "INGRESS"

  validation {
    condition     = contains(["INGRESS", "EGRESS"], var.direction)
    error_message = "direction must be either INGRESS or EGRESS."
  }
}

variable "priority" {
  description = "Priority for the firewall rule."
  type        = number
  default     = 1000
}

variable "disabled" {
  description = "Whether the firewall rule is disabled."
  type        = bool
  default     = false
}

variable "source_ranges" {
  description = "List of source CIDR ranges (for INGRESS rules)."
  type        = list(string)
  default     = []
}

variable "destination_ranges" {
  description = "List of destination CIDR ranges (for EGRESS rules)."
  type        = list(string)
  default     = []
}

variable "source_tags" {
  description = "List of source instance tags (for INGRESS rules)."
  type        = list(string)
  default     = []
}

variable "target_tags" {
  description = "List of target instance tags."
  type        = list(string)
  default     = []
}

variable "source_service_accounts" {
  description = "List of source service account emails (for INGRESS rules)."
  type        = list(string)
  default     = []
}

variable "target_service_accounts" {
  description = "List of target service account emails."
  type        = list(string)
  default     = []
}

variable "allow" {
  description = "List of allow rules, each with a protocol and optional list of ports."
  type = list(object({
    protocol = string
    ports    = optional(list(string))
  }))
  default = []
}

variable "deny" {
  description = "List of deny rules, each with a protocol and optional list of ports."
  type = list(object({
    protocol = string
    ports    = optional(list(string))
  }))
  default = []
}

variable "log_config_metadata" {
  description = "Enables firewall logging when set. Either EXCLUDE_ALL_METADATA or INCLUDE_ALL_METADATA."
  type        = string
  default     = null

  validation {
    condition     = var.log_config_metadata == null || contains(["EXCLUDE_ALL_METADATA", "INCLUDE_ALL_METADATA"], var.log_config_metadata)
    error_message = "log_config_metadata must be either EXCLUDE_ALL_METADATA or INCLUDE_ALL_METADATA."
  }
}
