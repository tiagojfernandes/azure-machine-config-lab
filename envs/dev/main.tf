# Development Environment - Main Configuration

# Core Resource Group
module "core_rg" {
  source = "../../modules/core_rg"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# Network Infrastructure
module "network" {
  source = "../../modules/network"

  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = module.core_rg.resource_group_location
  resource_group_name = module.core_rg.resource_group_name
  subnets             = var.subnets
  nsg_name            = var.nsg_name
  tags                = var.tags
}

# Windows Virtual Machine
module "compute_windows" {
  source = "../../modules/compute_windows"

  vm_name             = var.windows_vm_name
  location            = module.core_rg.resource_group_location
  resource_group_name = module.core_rg.resource_group_name
  subnet_id           = module.network.subnet_ids["default"]
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  tags                = var.tags
}

# Linux Virtual Machine
module "compute_linux" {
  source = "../../modules/compute_linux"

  vm_name             = var.linux_vm_name
  location            = module.core_rg.resource_group_location
  resource_group_name = module.core_rg.resource_group_name
  subnet_id           = module.network.subnet_ids["default"]
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_ssh_key       = var.admin_ssh_key
  tags                = var.tags
}

# Monitoring
module "monitoring" {
  source = "../../modules/monitoring"

  log_analytics_workspace_name = var.log_analytics_workspace_name
  location                     = module.core_rg.resource_group_location
  resource_group_name          = module.core_rg.resource_group_name
  dcr_name                     = var.dcr_name
  tags                         = var.tags
}

# Machine Configuration Prerequisites
module "mc_prereqs" {
  source = "../../modules/mc_prereqs"

  managed_identity_name  = var.mc_managed_identity_name
  resource_group_name    = module.core_rg.resource_group_name
  location               = module.core_rg.resource_group_location
  create_storage_account = var.create_mc_storage_account
  storage_account_name   = var.mc_storage_account_name
  vm_principal_ids = {
    windows = module.compute_windows.vm_identity_principal_id
    linux   = module.compute_linux.vm_identity_principal_id
  }
  tags = var.tags
}

# MDC Security Baseline
module "mc_mdc_baseline" {
  source = "../../modules/mc_mdc_baseline"

  resource_group_id       = module.core_rg.resource_group_id
  location                = module.core_rg.resource_group_location
  enable_windows_baseline = var.enable_windows_baseline
  enable_linux_baseline   = var.enable_linux_baseline
  policy_effect           = var.mdc_policy_effect
}

# Custom Machine Configurations
module "mc_custom_configs" {
  source = "../../modules/mc_custom_configs"

  location = module.core_rg.resource_group_location
  windows_vm_ids = {
    (var.windows_vm_name) = module.compute_windows.vm_id
  }
  linux_vm_ids = {
    (var.linux_vm_name) = module.compute_linux.vm_id
  }
  assignment_type       = var.mc_assignment_type
  configuration_version = var.mc_configuration_version
}
