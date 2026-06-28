# ===========================================
# Variables : Google Compute Network
# (require)
# - name
# (optional)
# - project
# - description
# - auto_create_subnetworks
# - routing_mode
# - mtu
# - delete_default_routes_on_create
# - subnets (list)
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Name of the VPC network. Changing this forces a new resource to be created."
}
variable "project" {
  type        = string
  description = "(Optional) The ID of the project in which the resource belongs. Defaults to the provider project."
  default     = null
}
variable "description" {
  type        = string
  description = "(Optional) A description of the VPC network."
  default     = null
}
variable "auto_create_subnetworks" {
  type        = bool
  description = "(Optional) Whether subnetworks should be created automatically across every region. Should be false for custom-mode VPCs that define their own subnets."
  default     = false
}
variable "routing_mode" {
  type        = string
  description = "(Optional) The network-wide routing mode. Possible values are REGIONAL and GLOBAL."
  default     = "REGIONAL"
}
variable "mtu" {
  type        = number
  description = "(Optional) The network MTU in bytes. Must be between 1300 and 8896."
  default     = 1460
}
variable "delete_default_routes_on_create" {
  type        = bool
  description = "(Optional) Whether to remove the default internet gateway route (0.0.0.0/0) after the network is created."
  default     = false
}
variable "subnets" {
  description = "(Optional) List of subnetworks to create within this network."
  type = list(object({
    name                     = string
    region                   = string
    ip_cidr_range            = string
    private_ip_google_access = optional(bool, false)
    flow_logs_enabled        = optional(bool, false)
    secondary_ip_ranges = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })), [])
  }))
  default = []
}
