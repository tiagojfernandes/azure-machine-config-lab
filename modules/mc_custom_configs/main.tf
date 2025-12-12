# Machine Configuration - Custom Configurations Module

# Guest Configuration Assignment for Windows
resource "azurerm_policy_virtual_machine_configuration_assignment" "windows_custom" {
  for_each = var.windows_vm_ids

  name               = "${each.key}-custom-config"
  location           = var.location
  virtual_machine_id = each.value

  configuration {
    assignment_type = var.assignment_type
    version         = var.configuration_version
    name            = var.windows_configuration_name

    dynamic "parameter" {
      for_each = var.windows_configuration_parameters
      content {
        name  = parameter.key
        value = parameter.value
      }
    }
  }
}

# Guest Configuration Assignment for Linux
resource "azurerm_policy_virtual_machine_configuration_assignment" "linux_custom" {
  for_each = var.linux_vm_ids

  name               = "${each.key}-custom-config"
  location           = var.location
  virtual_machine_id = each.value

  configuration {
    assignment_type = var.assignment_type
    version         = var.configuration_version
    name            = var.linux_configuration_name

    dynamic "parameter" {
      for_each = var.linux_configuration_parameters
      content {
        name  = parameter.key
        value = parameter.value
      }
    }
  }
}

# Custom policy definition for guest configuration
resource "azurerm_policy_definition" "custom_gc_policy" {
  count = var.create_custom_policy ? 1 : 0

  name         = var.custom_policy_name
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = var.custom_policy_display_name
  description  = var.custom_policy_description

  metadata = jsonencode({
    category               = "Guest Configuration"
    guestConfiguration = {
      name    = var.guest_configuration_name
      version = var.configuration_version
    }
  })

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field  = "type"
          equals = "Microsoft.Compute/virtualMachines"
        }
      ]
    }
    then = {
      effect = var.policy_effect
      details = {
        type = "Microsoft.GuestConfiguration/guestConfigurationAssignments"
        name = var.guest_configuration_name
      }
    }
  })
}
