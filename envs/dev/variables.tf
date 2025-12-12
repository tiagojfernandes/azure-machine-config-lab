# Development Environment Variables

# General
variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {
    default = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

# Compute
variable "windows_vm_name" {
  description = "Name of the Windows VM"
  type        = string
}

variable "linux_vm_name" {
  description = "Name of the Linux VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for Windows VM"
  type        = string
  sensitive   = true
}

variable "admin_ssh_key" {
  description = "SSH public key for Linux VM"
  type        = string
  default     = null
}

# Monitoring
variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "dcr_name" {
  description = "Name of the Data Collection Rule"
  type        = string
}

# Machine Configuration
variable "mc_managed_identity_name" {
  description = "Name of the managed identity for Machine Configuration"
  type        = string
}

variable "create_mc_storage_account" {
  description = "Whether to create a storage account for MC packages"
  type        = bool
  default     = true
}

variable "mc_storage_account_name" {
  description = "Name of the storage account for MC packages"
  type        = string
  default     = ""
}

variable "enable_windows_baseline" {
  description = "Enable Windows MDC security baseline"
  type        = bool
  default     = true
}

variable "enable_linux_baseline" {
  description = "Enable Linux MDC security baseline"
  type        = bool
  default     = true
}

variable "mdc_policy_effect" {
  description = "Effect for MDC baseline policies"
  type        = string
  default     = "AuditIfNotExists"
}

variable "mc_assignment_type" {
  description = "Type of MC assignment"
  type        = string
  default     = "Audit"
}

variable "mc_configuration_version" {
  description = "Version of the MC configuration"
  type        = string
  default     = "1.0.0"
}
