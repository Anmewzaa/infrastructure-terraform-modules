# ===========================================
# Variables : TencentCloud Security Group
# ===========================================
# Required
# - name
#
# Optional
# - description
# - project_id
# - tags
# - ingress_rules
# - egress_rules

variable "name" {
  description = "Name of the security group."
  type        = string
}

variable "description" {
  description = "Description of the security group."
  type        = string
  default     = null
}

variable "project_id" {
  description = "Project ID to associate the security group with."
  type        = number
  default     = 0
}

variable "tags" {
  description = "Tags to apply to the security group."
  type        = map(string)
  default     = {}
}

variable "ingress_rules" {
  description = "Ordered list of inbound rules for the security group."
  type = list(object({
    action                 = string
    cidr_block             = optional(string)
    ipv6_cidr_block        = optional(string)
    source_security_id     = optional(string)
    protocol               = optional(string)
    port                   = optional(string)
    address_template_id    = optional(string)
    address_template_group = optional(string)
    service_template_id    = optional(string)
    service_template_group = optional(string)
    description            = optional(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "Ordered list of outbound rules for the security group."
  type = list(object({
    action                 = string
    cidr_block             = optional(string)
    ipv6_cidr_block        = optional(string)
    source_security_id     = optional(string)
    protocol               = optional(string)
    port                   = optional(string)
    address_template_id    = optional(string)
    address_template_group = optional(string)
    service_template_id    = optional(string)
    service_template_group = optional(string)
    description            = optional(string)
  }))
  default = []
}
