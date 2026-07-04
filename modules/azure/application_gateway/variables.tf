# ===========================================
# Variables : Azurerm Application Gateway
# ===========================================
variable "name" {
  type        = string
  description = "Name of the Application Gateway."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "sku_name" {
  type        = string
  description = "SKU name (Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, WAF_v2)."
  default     = "Standard_v2"
}

variable "sku_tier" {
  type        = string
  description = "SKU tier (Standard, Standard_v2, WAF, WAF_v2)."
  default     = "Standard_v2"
}

variable "capacity" {
  type        = number
  description = "Number of instances (used when autoscale_configuration is null)."
  default     = 2
}

variable "autoscale_configuration" {
  type = object({
    min_capacity = number
    max_capacity = optional(number)
  })
  description = "Autoscale configuration. When set, capacity is ignored."
  default     = null
}

variable "gateway_ip_configurations" {
  type = list(object({
    name      = string
    subnet_id = string
  }))
  description = "List of gateway IP configurations."
}

variable "frontend_ip_configurations" {
  type = list(object({
    name                          = string
    public_ip_address_id          = optional(string)
    private_ip_address            = optional(string)
    subnet_id                     = optional(string)
    private_ip_address_allocation = optional(string)
  }))
  description = "List of frontend IP configurations."
}

variable "frontend_ports" {
  type = list(object({
    name = string
    port = number
  }))
  description = "List of frontend ports."
}

variable "backend_address_pools" {
  type = list(object({
    name         = string
    fqdns        = optional(list(string))
    ip_addresses = optional(list(string))
  }))
  description = "List of backend address pools."
}

variable "backend_http_settings" {
  type = list(object({
    name                  = string
    port                  = number
    protocol              = optional(string)
    cookie_based_affinity = optional(string)
    request_timeout       = optional(number)
    host_name             = optional(string)
    probe_name            = optional(string)
  }))
  description = "List of backend HTTP settings."
}

variable "http_listeners" {
  type = list(object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    protocol                       = optional(string)
    host_name                      = optional(string)
    ssl_certificate_name           = optional(string)
  }))
  description = "List of HTTP listeners."
}

variable "request_routing_rules" {
  type = list(object({
    name                        = string
    http_listener_name          = string
    rule_type                   = optional(string)
    backend_address_pool_name   = optional(string)
    backend_http_settings_name  = optional(string)
    redirect_configuration_name = optional(string)
    url_path_map_name           = optional(string)
    priority                    = optional(number)
  }))
  description = "List of request routing rules."
}

variable "ssl_certificates" {
  type = list(object({
    name                = string
    data                = optional(string)
    password            = optional(string)
    key_vault_secret_id = optional(string)
  }))
  description = "List of SSL certificates."
  default     = []
}

variable "probes" {
  type = list(object({
    name                                      = string
    host                                      = optional(string)
    interval                                  = optional(number)
    path                                      = optional(string)
    protocol                                  = optional(string)
    timeout                                   = optional(number)
    unhealthy_threshold                       = optional(number)
    pick_host_name_from_backend_http_settings = optional(bool)
  }))
  description = "List of health probes."
  default     = []
}

variable "waf_configuration" {
  type = object({
    enabled          = optional(bool)
    firewall_mode    = optional(string)
    rule_set_type    = optional(string)
    rule_set_version = optional(string)
  })
  description = "WAF configuration. Required when sku_tier is WAF or WAF_v2."
  default     = null
}

variable "identity_type" {
  type        = string
  description = "Identity type (SystemAssigned, UserAssigned, SystemAssigned, UserAssigned)."
  default     = null
}

variable "identity_ids" {
  type        = list(string)
  description = "List of user-assigned identity IDs."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resource."
  default     = {}
}
