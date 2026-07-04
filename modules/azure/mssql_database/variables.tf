# ===========================================
# Variables : Azurerm MSSQL Database
# ===========================================
# Required
# - name
# - server_id
#
# Optional
# - sku_name
# - max_size_gb
# - collation
# - license_type
# - create_mode
# - elastic_pool_id
# - read_scale
# - zone_redundant
# - transparent_data_encryption_enabled
# - tags

variable "name" {
  description = "Name of the MSSQL Database."
  type        = string
}

variable "server_id" {
  description = "ID of the MSSQL Server to create the database on."
  type        = string
}

variable "sku_name" {
  description = "SKU name for the database (e.g. S0, P1, GP_S_Gen5_2, Basic)."
  type        = string
  default     = "S0"
}

variable "max_size_gb" {
  description = "Maximum storage size in GB."
  type        = number
  default     = null
}

variable "collation" {
  description = "Database collation. Forces new resource on change."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "license_type" {
  description = "License type. One of: LicenseIncluded, BasePrice."
  type        = string
  default     = null
}

variable "create_mode" {
  description = "Database creation mode."
  type        = string
  default     = "Default"
}

variable "elastic_pool_id" {
  description = "ID of the Elastic Pool to place the database in."
  type        = string
  default     = null
}

variable "read_scale" {
  description = "Whether read-only connections are routed to secondary replicas (Premium/Business Critical only)."
  type        = bool
  default     = false
}

variable "zone_redundant" {
  description = "Whether to spread replicas across availability zones."
  type        = bool
  default     = false
}

variable "transparent_data_encryption_enabled" {
  description = "Whether Transparent Data Encryption is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the MSSQL Database."
  type        = map(string)
  default     = {}
}
