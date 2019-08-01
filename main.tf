# Log Analytics

resource "azurerm_resource_group" "default" {
  name     = module.rg_label.id
  location = var.region
  tags     = module.rg_label.tags
}

resource "azurerm_log_analytics_workspace" "default" {
  name                = module.log_analytics_workspace.id
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.log_analytics_retention_in_days
}

# Security Center



