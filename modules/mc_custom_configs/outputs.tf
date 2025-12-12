output "windows_configuration_assignment_ids" {
  description = "Map of Windows VM names to their configuration assignment IDs"
  value       = { for k, v in azurerm_policy_virtual_machine_configuration_assignment.windows_custom : k => v.id }
}

output "linux_configuration_assignment_ids" {
  description = "Map of Linux VM names to their configuration assignment IDs"
  value       = { for k, v in azurerm_policy_virtual_machine_configuration_assignment.linux_custom : k => v.id }
}

output "custom_policy_id" {
  description = "The ID of the custom policy definition"
  value       = var.create_custom_policy ? azurerm_policy_definition.custom_gc_policy[0].id : null
}
