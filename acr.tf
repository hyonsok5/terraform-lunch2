resource "azurerm_container_registry" "acr_dev_ablunch2_aztech_kc" {
  name                     = "acr-dev-ablunch2-aztech-kc"
  resource_group_name      = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  location                 = var.location
  sku                      = "Premium"
  admin_enabled            = false
  georeplication_locations = ["East US", "West Europe"]
}