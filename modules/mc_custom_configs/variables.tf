variable "location" {
  description = "Azure region for the configuration assignments"
  type        = string
}

variable "windows_vm_ids" {
  description = "Map of Windows VM names to IDs for custom configuration"
  type        = map(string)
  default     = {}
}

variable "linux_vm_ids" {
  description = "Map of Linux VM names to IDs for custom configuration"
  type        = map(string)
  default     = {}
}

variable "assignment_type" {
  description = "Type of configuration assignment (Audit, ApplyAndMonitor, ApplyAndAutoCorrect)"
  type        = string
  default     = "Audit"
}

variable "configuration_version" {
  description = "Version of the guest configuration"
  type        = string
  default     = "1.0.0"
}

variable "windows_configuration_name" {
  description = "Name of the Windows guest configuration"
  type        = string
  default     = "WindowsCustomConfig"
}

variable "linux_configuration_name" {
  description = "Name of the Linux guest configuration"
  type        = string
  default     = "LinuxCustomConfig"
}

variable "windows_configuration_parameters" {
  description = "Parameters for Windows guest configuration"
  type        = map(string)
  default     = {}
}

variable "linux_configuration_parameters" {
  description = "Parameters for Linux guest configuration"
  type        = map(string)
  default     = {}
}

variable "create_custom_policy" {
  description = "Whether to create a custom policy definition"
  type        = bool
  default     = false
}

variable "custom_policy_name" {
  description = "Name of the custom policy definition"
  type        = string
  default     = "custom-gc-policy"
}

variable "custom_policy_display_name" {
  description = "Display name of the custom policy"
  type        = string
  default     = "Custom Guest Configuration Policy"
}

variable "custom_policy_description" {
  description = "Description of the custom policy"
  type        = string
  default     = "Custom guest configuration policy for compliance"
}

variable "guest_configuration_name" {
  description = "Name of the guest configuration for the policy"
  type        = string
  default     = "CustomGuestConfiguration"
}

variable "policy_effect" {
  description = "Effect for the custom policy"
  type        = string
  default     = "AuditIfNotExists"
}
