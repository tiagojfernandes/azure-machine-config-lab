output "managed_identity_id" {
  description = "The ID of the user-assigned managed identity"
  value       = azurerm_user_assigned_identity.mc_identity.id
}

output "managed_identity_principal_id" {
  description = "The principal ID of the user-assigned managed identity"
  value       = azurerm_user_assigned_identity.mc_identity.principal_id
}

output "managed_identity_client_id" {
  description = "The client ID of the user-assigned managed identity"
  value       = azurerm_user_assigned_identity.mc_identity.client_id
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = var.create_storage_account ? azurerm_storage_account.mc_storage[0].id : null
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = var.create_storage_account ? azurerm_storage_account.mc_storage[0].name : null
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = var.create_storage_account ? azurerm_storage_container.mc_container[0].name : null
}
