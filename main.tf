# Log Analytics

resource "azurerm_resource_group" "default" {
  count    = var.paas_enabled == true ? length(keys(var.paas_config.location)) : 0
  # name     = module.rg_label.id
  # location = var.region
  name     = "${element(keys(var.paas_config.location), count.index)}${var.sharedservices_name}${length(keys(var.paas_config.location))}${module.rg_label.delimiter}${element(module.rg_label.attributes, 0)}"
  location = element(values(var.paas_config.location), count.index)
  tags     = module.rg_label.tags
}

resource "azurerm_log_analytics_workspace" "default" {
  count    = var.paas_enabled == true ? length(keys(var.paas_config.location)) : 0
  name                = module.log_analytics_workspace.id
  location            = azurerm_resource_group.default.*.location[count.index]
  resource_group_name = azurerm_resource_group.default.*.name[count.index]
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


