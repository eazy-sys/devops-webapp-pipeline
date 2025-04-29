resource "azurerm_container_registry" "acr" {
  name                = "devopsacr${var.acr_name_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
