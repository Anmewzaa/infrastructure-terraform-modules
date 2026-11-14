# ===========================================
# Variables : Azurerm Subnet Route Table Association
# (require)
# - subnet_id
# - route_table_id
# ===========================================
variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet. Changing this forces a new resource to be created."
}
variable "route_table_id" {
  type        = string
  description = "(Required) The ID of the Route Table to associate with the subnet."
}
