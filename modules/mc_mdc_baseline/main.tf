# Machine Configuration - Microsoft Defender for Cloud Baseline Module

# Azure Policy Assignment for MDC Windows Security Baseline
resource "azurerm_resource_group_policy_assignment" "mdc_windows_baseline" {
  count = var.enable_windows_baseline ? 1 : 0

  name                 = "mdc-windows-baseline"
  resource_group_id    = var.resource_group_id
  policy_definition_id = var.windows_baseline_policy_id
  display_name         = "MDC Windows Security Baseline"
  description          = "Microsoft Defender for Cloud Windows security baseline configuration"

  identity {
    type = "SystemAssigned"
  }

  location = var.location

  parameters = jsonencode({
    effect = {
      value = var.policy_effect
    }
  })
}

# Azure Policy Assignment for MDC Linux Security Baseline
resource "azurerm_resource_group_policy_assignment" "mdc_linux_baseline" {
  count = var.enable_linux_baseline ? 1 : 0

  name                 = "mdc-linux-baseline"
  resource_group_id    = var.resource_group_id
  policy_definition_id = var.linux_baseline_policy_id
  display_name         = "MDC Linux Security Baseline"
  description          = "Microsoft Defender for Cloud Linux security baseline configuration"

  identity {
    type = "SystemAssigned"
  }

  location = var.location

  parameters = jsonencode({
    effect = {
      value = var.policy_effect
    }
  })
}

# Role assignment for policy remediation
resource "azurerm_role_assignment" "policy_contributor_windows" {
  count = var.enable_windows_baseline ? 1 : 0

  scope                = var.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_group_policy_assignment.mdc_windows_baseline[0].identity[0].principal_id
}

resource "azurerm_role_assignment" "policy_contributor_linux" {
  count = var.enable_linux_baseline ? 1 : 0

  scope                = var.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_resource_group_policy_assignment.mdc_linux_baseline[0].identity[0].principal_id
}
