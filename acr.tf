resource "azurerm_container_registry" "acr_dev_ablunch2_aztech_kc" {
  name                     = "acrdevablunch2aztechkc"
  resource_group_name      = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  location                 = var.location
  sku                      = "Standard"
  admin_enabled            = false
  # georeplication_locations = ["Southeast Asia", "East Japan"]
}