resource "azurerm_cosmosdb_account" "cosmosdb_dev_lunch2_aztech_kc" {
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
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmossql_dev_lunch2_aztech_kc" {
  name                = "cosmossql-dev-lunch2-aztech-kc"
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  account_name        = azurerm_cosmosdb_account.cosmosdb_dev_lunch2_aztech_kc.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "example" {
  name                  = "cosmoscontainer-dev-lunch2-aztech-kc"
  resource_group_name   = azurerm_cosmosdb_account.example.resource_group_name
  account_name          = azurerm_cosmosdb_account.example.name
  database_name         = azurerm_cosmosdb_sql_database.example.name
  partition_key_path    = "/lunch_menu/id"
  partition_key_version = 1
  throughput            = 400

#   indexing_policy {
#     indexing_mode = "Consistent"

#     included_path {
#       path = "/*"
#     }

#     included_path {
#       path = "/included/?"
#     }

#     excluded_path {
#       path = "/excluded/?"
#     }
#   }

#   unique_key {
#     paths = ["/definition/idlong", "/definition/idshort"]
#   }
}