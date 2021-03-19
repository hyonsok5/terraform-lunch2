resource "azurerm_cosmosdb_account" "db" {
  name                = "cosmosdb-dev-lunch2-aztech-kc"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  offer_type          = "Standard"

  enable_automatic_failover = true

  capabilities {
    name = "EnableAggregationPipeline"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
    failover_priority = 0
  }
}