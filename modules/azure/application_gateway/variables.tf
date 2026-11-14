# ===========================================
# Variables : Azurerm Application Gateway
# (require)
# - name
# - resource_group_name
# - subnet_id
# - public_ip_address_id
# - frontend_ports
# - backend_address_pools
# - backend_http_settings
# - http_listeners
# - request_routing_rules
# (optional)
# - sku_name
# - sku_tier
# - capacity
# - autoscale_configuration
# - zones
# - http2_enabled
# - firewall_policy_id
# - probes
# - ssl_certificates
# - identity_ids
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Application Gateway. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
}
variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the dedicated subnet for the Application Gateway."
}
variable "public_ip_address_id" {
  type        = string
  description = "(Required) The ID of the Standard/Static Public IP used for the frontend."
}
variable "sku_name" {
  type        = string
  description = "(Optional) The SKU name: Standard_v2 or WAF_v2."
  default     = "Standard_v2"
}
variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU tier: Standard_v2 or WAF_v2."
  default     = "Standard_v2"
}
variable "capacity" {
  type        = number
  description = "(Optional) Fixed instance count. Ignored when autoscale_configuration is set."
  default     = 2
}
variable "autoscale_configuration" {
  type        = object({ min_capacity = number, max_capacity = optional(number) })
  description = "(Optional) Autoscale configuration. Leave null for a fixed capacity."
  default     = null
}
variable "zones" {
  type        = list(string)
  description = "(Optional) A list of availability zones."
  default     = null
}
variable "http2_enabled" {
  type        = bool
  description = "(Optional) Whether HTTP2 is enabled."
  default     = true
}
variable "firewall_policy_id" {
  type        = string
  description = "(Optional) The ID of a WAF policy to associate with the gateway (WAF_v2)."
  default     = null
}
variable "frontend_ports" {
  type        = list(object({ name = string, port = number }))
  description = "(Required) Frontend ports."
}
variable "backend_address_pools" {
  type        = list(object({ name = string, fqdns = optional(list(string), []), ip_addresses = optional(list(string), []) }))
  description = "(Required) Backend address pools."
}
variable "probes" {
  type        = list(object({ name = string, protocol = string, path = string, interval = optional(number, 30), timeout = optional(number, 30), unhealthy_threshold = optional(number, 3), host = optional(string), pick_host_name_from_backend_http_settings = optional(bool, false) }))
  description = "(Optional) Custom health probes."
  default     = []
}
variable "backend_http_settings" {
  type        = list(object({ name = string, port = number, protocol = string, cookie_based_affinity = optional(string, "Disabled"), request_timeout = optional(number, 30), path = optional(string), host_name = optional(string), pick_host_name_from_backend_address = optional(bool, false), probe_name = optional(string) }))
  description = "(Required) Backend HTTP settings."
}
variable "ssl_certificates" {
  type        = list(object({ name = string, key_vault_secret_id = optional(string), data = optional(string), password = optional(string) }))
  description = "(Optional) SSL certificates (Key Vault secret ID, or PFX data + password)."
  default     = []
  sensitive   = true
}
variable "http_listeners" {
  type        = list(object({ name = string, frontend_port_name = string, protocol = optional(string, "Http"), host_name = optional(string), ssl_certificate_name = optional(string), require_sni = optional(bool) }))
  description = "(Required) HTTP listeners."
}
variable "request_routing_rules" {
  type        = list(object({ name = string, rule_type = optional(string, "Basic"), priority = number, http_listener_name = string, backend_address_pool_name = string, backend_http_settings_name = string }))
  description = "(Required) Request routing rules."
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) User Assigned Identity IDs (e.g. for Key Vault certificates). Leave empty for no identity."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
