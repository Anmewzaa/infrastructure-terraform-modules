# ===========================================
# Variables : Azurerm Load Balancer
# (require)
# - name
# - resource_group_name
# - frontend_ip_configurations
# (optional)
# - sku
# - sku_tier
# - backend_pool_names
# - probes
# - rules
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Load Balancer. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Load Balancer: Basic, Standard or Gateway."
  default     = "Standard"
}
variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU tier: Regional or Global."
  default     = "Regional"
}
variable "frontend_ip_configurations" {
  type        = list(object({ name = string, public_ip_address_id = optional(string), subnet_id = optional(string), private_ip_address = optional(string), private_ip_address_allocation = optional(string, "Dynamic"), zones = optional(list(string)) }))
  description = "(Required) Frontend IP configurations. Set public_ip_address_id for a public LB or subnet_id for an internal LB."
}
variable "backend_pool_names" {
  type        = list(string)
  description = "(Optional) Names of the backend address pools to create."
  default     = []
}
variable "probes" {
  type        = list(object({ name = string, protocol = string, port = number, request_path = optional(string), interval_in_seconds = optional(number, 15), probe_threshold = optional(number, 1) }))
  description = "(Optional) Health probes."
  default     = []
}
variable "rules" {
  type        = list(object({ name = string, protocol = string, frontend_port = number, backend_port = number, frontend_ip_configuration_name = string, backend_pool_name = string, probe_name = optional(string), idle_timeout_in_minutes = optional(number, 4), floating_ip_enabled = optional(bool, false), disable_outbound_snat = optional(bool, false) }))
  description = "(Optional) Load balancing rules. backend_pool_name must be listed in backend_pool_names; probe_name must match a probe."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
