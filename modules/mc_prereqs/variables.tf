variable "managed_identity_name" {
  description = "Name of the user-assigned managed identity"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "create_storage_account" {
  description = "Whether to create a storage account for MC packages"
  type        = bool
  default     = true
}

variable "storage_account_name" {
  description = "Name of the storage account for MC packages"
  type        = string
  default     = ""
}

variable "storage_container_name" {
  description = "Name of the storage container for MC packages"
  type        = string
  default     = "guestconfiguration"
}

variable "existing_storage_account_id" {
  description = "ID of existing storage account if not creating new one"
  type        = string
  default     = ""
}

variable "vm_principal_ids" {
  description = "Map of VM names to their system-assigned identity principal IDs"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
