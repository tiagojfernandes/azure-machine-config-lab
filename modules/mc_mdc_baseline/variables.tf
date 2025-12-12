variable "resource_group_id" {
  description = "ID of the resource group for policy assignment"
  type        = string
}

variable "location" {
  description = "Azure region for the policy assignment identity"
  type        = string
}

variable "enable_windows_baseline" {
  description = "Enable Windows security baseline policy"
  type        = bool
  default     = true
}

variable "enable_linux_baseline" {
  description = "Enable Linux security baseline policy"
  type        = bool
  default     = true
}

variable "windows_baseline_policy_id" {
  description = "Policy definition ID for Windows security baseline"
  type        = string
  default     = "/providers/Microsoft.Authorization/policyDefinitions/72650e9f-97bc-4b2a-ab5f-9781a9fcecbc"
}

variable "linux_baseline_policy_id" {
  description = "Policy definition ID for Linux security baseline"
  type        = string
  default     = "/providers/Microsoft.Authorization/policyDefinitions/fc9b3da7-8347-4380-8e70-0a0361d8dedd"
}

variable "policy_effect" {
  description = "Effect for the policy (AuditIfNotExists or DeployIfNotExists)"
  type        = string
  default     = "AuditIfNotExists"
}
