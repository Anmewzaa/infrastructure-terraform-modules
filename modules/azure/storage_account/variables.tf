# ===========================================
# Variables : Azurerm Storage Account
# (require)
# - name
# - resource_group_name
# (optional)
# - account_tier
# - account_replication_type
# - account_kind
# - access_tier
# - min_tls_version
# - https_traffic_only_enabled
# - public_network_access_enabled
# - allow_nested_items_to_be_public
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}
variable "account_tier" {
  type        = string
  description = "(Optional) Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  default     = "Standard"
}
variable "account_replication_type" {
  type        = string
  description = "(Optional) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "LRS"
}
variable "account_kind" {
  type        = string
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  default     = "StorageV2"
}
variable "access_tier" {
  type        = string
  description = "(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
}
variable "min_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for this storage account."
  default     = "TLS1_2"
}
variable "https_traffic_only_enabled" {
  type        = bool
  description = "(Optional) Boolean flag which forces HTTPS if enabled."
  default     = true
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this storage account."
  default     = true
}
variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "(Optional) Whether blobs and containers in this storage account can be public."
  default     = false
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
