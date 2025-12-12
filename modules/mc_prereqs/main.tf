# Machine Configuration Prerequisites Module

# User-assigned managed identity for Machine Configuration
resource "azurerm_user_assigned_identity" "mc_identity" {
  name                = var.managed_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# Storage account for Machine Configuration packages
resource "azurerm_storage_account" "mc_storage" {
  count = var.create_storage_account ? 1 : 0

  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags

  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "mc_container" {
  count = var.create_storage_account ? 1 : 0

  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.mc_storage[0].id
  container_access_type = "private"
}

# Role assignment for VM to access storage
resource "azurerm_role_assignment" "storage_blob_reader" {
  for_each = var.vm_principal_ids

  scope                = var.create_storage_account ? azurerm_storage_account.mc_storage[0].id : var.existing_storage_account_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = each.value
}
