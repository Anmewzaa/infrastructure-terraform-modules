# ===========================================
# Variables : Azurerm Kubernetes Cluster
# (require)
# - name
# - resource_group_name
# - dns_prefix
# - default_node_pool (object)
# (optional)
# - kubernetes_version
# - sku_tier
# - private_cluster_enabled
# - azure_policy_enabled
# - oidc_issuer_enabled
# - workload_identity_enabled
# - identity_type
# - identity_ids (list)
# - network_plugin
# - network_policy
# - service_cidr
# - dns_service_ip
# - kms_enabled
# - kms_key_vault_key_id
# - kms_key_vault_network_access
# - tags
# ===========================================
variable "name" {
  type        = string
  description = "(Required) The name of the Kubernetes Cluster. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Kubernetes Cluster. Changing this forces a new resource to be created."
}
variable "dns_prefix" {
  type        = string
  description = "(Required) DNS prefix specified when creating the managed cluster."
}
variable "default_node_pool" {
  description = "(Required) The default node pool configuration for the Kubernetes Cluster."
  type = object({
    name                 = optional(string, "default")
    vm_size              = string
    node_count           = optional(number, 3)
    auto_scaling_enabled = optional(bool, false)
    min_count            = optional(number)
    max_count            = optional(number)
    vnet_subnet_id       = optional(string)
    os_disk_size_gb      = optional(number)
    zones                = optional(list(string))
  })
}
variable "kubernetes_version" {
  type        = string
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster."
  default     = null
}
variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard and Premium."
  default     = "Free"
}
variable "private_cluster_enabled" {
  type        = bool
  description = "(Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses."
  default     = false
}
variable "azure_policy_enabled" {
  type        = bool
  description = "(Optional) Should the Azure Policy Add-On be enabled."
  default     = false
}
variable "oidc_issuer_enabled" {
  type        = bool
  description = "(Optional) Should the OIDC issuer be enabled. Required for workload identity."
  default     = false
}
variable "workload_identity_enabled" {
  type        = bool
  description = "(Optional) Should Azure AD Workload Identity be enabled. Requires oidc_issuer_enabled to be true."
  default     = false
}
variable "identity_type" {
  type        = string
  description = "(Optional) The type of Managed Identity for this Kubernetes Cluster. Possible values are SystemAssigned and UserAssigned."
  default     = "SystemAssigned"
}
variable "identity_ids" {
  type        = list(string)
  description = "(Optional) A list of User Assigned Identity IDs to be assigned to this Kubernetes Cluster. Required when identity_type is UserAssigned."
  default     = []
}
variable "network_plugin" {
  type        = string
  description = "(Optional) Network plugin used for building the Kubernetes network. Possible values are azure, kubenet and none."
  default     = "azure"
}
variable "network_policy" {
  type        = string
  description = "(Optional) Sets up network policy to be used with Azure CNI. Possible values are calico and azure."
  default     = null
}
variable "service_cidr" {
  type        = string
  description = "(Optional) The Network Range used by the Kubernetes service."
  default     = null
}
variable "dns_service_ip" {
  type        = string
  description = "(Optional) IP address within the Kubernetes service address range used by cluster service discovery."
  default     = null
}
variable "kms_enabled" {
  type        = bool
  description = "(Optional) Whether to enable Key Management Service (KMS) etcd encryption backed by an Azure Key Vault key. The cluster's identity (kms_key_vault_key_id) must already have permission to use the key."
  default     = false
}
variable "kms_key_vault_key_id" {
  type        = string
  description = "(Optional) The ID of the Key Vault key used for KMS etcd encryption. Required when kms_enabled is true."
  default     = null
}
variable "kms_key_vault_network_access" {
  type        = string
  description = "(Optional) Network access of the key vault used for KMS. Possible values are Public and Private. Use Private when the Key Vault is only reachable via a Private Endpoint."
  default     = "Public"
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
