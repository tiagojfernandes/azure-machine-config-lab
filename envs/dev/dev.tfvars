# Development Environment Variable Values

# General
location            = "eastus"
resource_group_name = "rg-mc-lab-dev"

tags = {
  Environment = "Development"
  Project     = "Machine-Config-Lab"
  ManagedBy   = "Terraform"
}

# Network
vnet_name     = "vnet-mc-lab-dev"
address_space = ["10.0.0.0/16"]
subnets = {
  default = {
    address_prefixes = ["10.0.1.0/24"]
  }
  management = {
    address_prefixes = ["10.0.2.0/24"]
  }
}
nsg_name = "nsg-mc-lab-dev"

# Compute
windows_vm_name = "vm-win-mc-dev"
linux_vm_name   = "vm-linux-mc-dev"
vm_size         = "Standard_DS1_v2"
admin_username  = "azureadmin"
# admin_password should be provided via environment variable or secret management
# admin_ssh_key should be provided for Linux VM authentication

# Monitoring
log_analytics_workspace_name = "law-mc-lab-dev"
dcr_name                     = "dcr-mc-lab-dev"

# Machine Configuration
mc_managed_identity_name  = "id-mc-lab-dev"
create_mc_storage_account = true
mc_storage_account_name   = "stmclabdev"
enable_windows_baseline   = true
enable_linux_baseline     = true
mdc_policy_effect         = "AuditIfNotExists"
mc_assignment_type        = "Audit"
mc_configuration_version  = "1.0.0"
