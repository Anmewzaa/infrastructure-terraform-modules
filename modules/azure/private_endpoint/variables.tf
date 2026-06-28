# ===========================================
# Variables : Azurerm Private Endpoint
# (require)
# - name
# - resource_group_name
# - subnet_id
# - private_connection_resource_id
# - subresource_names (list)
# (optional)
# - is_manual_connection
# - private_dns_zone_group_name
# - private_dns_zone_ids (list)
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the private endpoint. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the private endpoint. Changing this forces a new resource to be created."
}
variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."
}
variable "private_connection_resource_id" {
  type        = string
  description = "(Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
}
variable "subresource_names" {
  type        = list(string)
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to, e.g. blob, vault, sqlServer."
  default     = []
}
variable "is_manual_connection" {
  type        = bool
  description = "(Optional) Does the Private Endpoint require Manual Approval from the remote resource owner."
  default     = false
}
variable "private_dns_zone_group_name" {
  type        = string
  description = "(Optional) The name of the Private DNS Zone Group."
  default     = "default"
}
variable "private_dns_zone_ids" {
  type        = list(string)
  description = "(Optional) A list of Private DNS Zone IDs to associate with the Private Endpoint. When empty, no private_dns_zone_group is created."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
