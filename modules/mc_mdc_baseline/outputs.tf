output "windows_baseline_assignment_id" {
  description = "The ID of the Windows baseline policy assignment"
  value       = var.enable_windows_baseline ? azurerm_resource_group_policy_assignment.mdc_windows_baseline[0].id : null
}

output "linux_baseline_assignment_id" {
  description = "The ID of the Linux baseline policy assignment"
  value       = var.enable_linux_baseline ? azurerm_resource_group_policy_assignment.mdc_linux_baseline[0].id : null
}

output "windows_baseline_identity_principal_id" {
  description = "The principal ID of the Windows baseline policy assignment identity"
  value       = var.enable_windows_baseline ? azurerm_resource_group_policy_assignment.mdc_windows_baseline[0].identity[0].principal_id : null
}

output "linux_baseline_identity_principal_id" {
  description = "The principal ID of the Linux baseline policy assignment identity"
  value       = var.enable_linux_baseline ? azurerm_resource_group_policy_assignment.mdc_linux_baseline[0].identity[0].principal_id : null
}
