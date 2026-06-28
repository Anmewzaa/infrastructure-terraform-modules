# ===========================================
# Variables : Azurerm Virtual Machine
# (require)
# - name
# - resource_group_name
# - size
# - admin_username
# - subnet_id
# (optional)
# - os_type
# - admin_password
# - admin_ssh_public_key
# - disable_password_authentication
# - private_ip_address_allocation
# - private_ip_address
# - public_ip_address_id
# - source_image_reference (object)
# - os_disk_caching
# - os_disk_storage_account_type
# - os_disk_size_gb
# - custom_data
# - identity_type
# - identity_ids (list)
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Virtual Machine. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Virtual Machine. Changing this forces a new resource to be created."
}
variable "size" {
  type        = string
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_B2s."
}
variable "admin_username" {
  type        = string
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
}
variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the Subnet where the Virtual Machine's network interface should be created."
}
variable "os_type" {
  type        = string
  description = "(Optional) The operating system family for the Virtual Machine. Possible values are Linux and Windows."
  default     = "Linux"

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either \"Linux\" or \"Windows\"."
  }
}
variable "admin_password" {
  type        = string
  description = "(Optional) The password associated with the local administrator account. Required for Windows, and for Linux when disable_password_authentication is false."
  default     = null
  sensitive   = true
}
variable "admin_ssh_public_key" {
  type        = string
  description = "(Optional) The SSH public key used to authenticate to the Virtual Machine. Only used when os_type is Linux."
  default     = null
}
variable "disable_password_authentication" {
  type        = bool
  description = "(Optional) Whether password authentication should be disabled on this Linux Virtual Machine."
  default     = true
}
variable "private_ip_address_allocation" {
  type        = string
  description = "(Optional) The allocation method used for the private IP address on the network interface. Possible values are Dynamic and Static."
  default     = "Dynamic"
}
variable "private_ip_address" {
  type        = string
  description = "(Optional) The static private IP address to assign to the network interface. Required when private_ip_address_allocation is Static."
  default     = null
}
variable "public_ip_address_id" {
  type        = string
  description = "(Optional) The ID of an existing Public IP Address to associate with the network interface."
  default     = null
}
variable "source_image_reference" {
  description = "(Optional) The source image reference used to create the Virtual Machine."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
variable "os_disk_caching" {
  type        = string
  description = "(Optional) The Type of Caching which should be used for the OS Disk. Possible values are None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}
variable "os_disk_storage_account_type" {
  type        = string
  description = "(Optional) The Type of Storage Account which should back this the Internal OS Disk."
  default     = "Standard_LRS"
}
variable "os_disk_size_gb" {
  type        = number
  description = "(Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the source image."
  default     = null
}
variable "custom_data" {
  type        = string
  description = "(Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine, such as a cloud-init script."
  default     = null
}
variable "identity_type" {
  type        = string
  description = "(Optional) The type of Managed Identity for this Virtual Machine. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned. Set to null to disable."
  default     = "SystemAssigned"
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Identity IDs to be assigned to this Virtual Machine. Required when identity_type includes UserAssigned."
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
