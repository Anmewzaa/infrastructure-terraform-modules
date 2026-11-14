# ===========================================
# Variables : Azurerm Subnet Network Security Group Association
# (require)
# - subnet_id
# - network_security_group_id
# ===========================================
variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet. Changing this forces a new resource to be created."
}
variable "network_security_group_id" {
  type        = string
  description = "(Required) The ID of the Network Security Group to associate with the subnet. Changing this forces a new resource to be created."
}
