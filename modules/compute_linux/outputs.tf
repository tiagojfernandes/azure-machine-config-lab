output "vm_id" {
  description = "The ID of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.main.id
}

output "vm_name" {
  description = "The name of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.main.name
}

output "vm_private_ip" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.main.private_ip_address
}

output "vm_identity_principal_id" {
  description = "The principal ID of the system assigned identity"
  value       = azurerm_linux_virtual_machine.main.identity[0].principal_id
}
