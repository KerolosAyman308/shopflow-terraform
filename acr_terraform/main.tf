resource "azurerm_resource_group" "rg" {
  name     = var.resource_group.name
  location = var.resource_group.loc
}

resource "azurerm_container_registry" "acr" {
  name                          = var.config.registry_name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  sku                           = "Standard"
  admin_enabled                 = false
  public_network_access_enabled = true
  # georeplications {
  #   location                = "switzerlandnorth"
  #   zone_redundancy_enabled = false
  #   tags                    = {}
  # }
}

resource "azurerm_container_registry_scope_map" "scope_map" {
  name                    = "push-pull-scope"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = azurerm_resource_group.rg.name

  actions = [
    "repositories/*/content/read",
    "repositories/*/content/write"
  ]
}

resource "azurerm_container_registry_token" "acr_token" {
  name                    = var.config.token_name
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = azurerm_resource_group.rg.name
  scope_map_id            = azurerm_container_registry_scope_map.scope_map.id
}

resource "azurerm_container_registry_token_password" "acr_token_pass" {
  container_registry_token_id = azurerm_container_registry_token.acr_token.id

  password1 {
    expiry = "2027-12-31T23:59:59Z"
  }
}
