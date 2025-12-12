# Development Environment Variable Values

#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
location            = "eastus"
resource_group_name = "rg-mc-lab-dev"

tags = {
  Environment = "Development"
  Project     = "Machine-Config-Lab"
  ManagedBy   = "Terraform"
}

#------------------------------------------------------------------------------
# Network
#------------------------------------------------------------------------------
vnet_name     = "vnet-mc-lab-dev"
address_space = ["10.0.0.0/16"]

subnets = {
  default = {
    address_prefixes = ["10.0.1.0/24"]
  }
}

nsg_name = "nsg-mc-lab-dev"

# NSG Rules - Set your allowed IPs for RDP/SSH access
allow_rdp          = true
allow_ssh          = true
allowed_source_ips = [] # Add your public IP, e.g., ["203.0.113.50"]

#------------------------------------------------------------------------------
# Compute
#------------------------------------------------------------------------------
windows_vm_name          = "vm-win-mc-dev"
linux_vm_name            = "vm-linux-mc-dev"
vm_size                  = "Standard_DS1_v2"
admin_username           = "azureadmin"
create_windows_public_ip = false
create_linux_public_ip   = false

# Credentials - provide via environment variable or secret management:
# admin_password      = "..." # Required for Windows
# admin_ssh_key       = "..." # Recommended for Linux
# linux_admin_password = "..." # Alternative for Linux if not using SSH

#------------------------------------------------------------------------------
# Monitoring
#------------------------------------------------------------------------------
log_analytics_workspace_name = "law-mc-lab-dev"
dcr_name                     = "dcr-mc-lab-dev"

#------------------------------------------------------------------------------
# Machine Configuration - Prerequisites
#------------------------------------------------------------------------------
mc_prereqs_assignment_name    = "mc-prereqs"
create_mc_prereqs_remediation = false

#------------------------------------------------------------------------------
# Machine Configuration - MDC Baseline
#------------------------------------------------------------------------------
enable_mdc_baseline     = false # Set to true to enable full MCSB initiative
enable_windows_baseline = true
enable_linux_baseline   = true

#------------------------------------------------------------------------------
# Machine Configuration - Custom Configs
# Add your custom Guest Configuration policies here
#------------------------------------------------------------------------------
custom_policy_assignments = {
  # Example: Uncomment and customize as needed
  #
  # "tls-hardening" = {
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/xxxxx"
  #   display_name         = "TLS 1.2+ Enforcement"
  #   description          = "Ensure TLS 1.2 or higher is used"
  #   needs_remediation    = true
  #   create_remediation   = true
  # }
  #
  # "ssh-key-only" = {
  #   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/yyyyy"
  #   display_name         = "SSH Key-Based Authentication Only"
  #   description          = "Linux VMs should use SSH key authentication"
  #   needs_remediation    = false
  # }
}
