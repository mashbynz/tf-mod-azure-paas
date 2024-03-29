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

# Log Analytics Solutions

# resource "azurerm_log_analytics_solution" "AzureActivity" {
#   solution_name         = module.activity_solution.id
#   location              = azurerm_resource_group.default.location
#   resource_group_name   = azurerm_resource_group.default.name
#   workspace_resource_id = azurerm_log_analytics_workspace.default.id
#   workspace_name        = azurerm_log_analytics_workspace.default.name

#   plan {
#     publisher = var.solution_publisher
#     product   = var.solution_AzureActivity
#   }
# }

# Security Center

# resource "azurerm_security_center_workspace" "default" {
#   scope        = var.security_center_scope
#   workspace_id = azurerm_log_analytics_workspace.default.id
# }


