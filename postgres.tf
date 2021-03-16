resource "azurerm_postgresql_server" "pstgrsvr_dev_lunch2_aztech_kc" {
  name                = "pstgrsvr-dev-lunch2-aztech-kc"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name

  sku_name = "B_Gen5_1"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = ${{ var.psql_login }}
  administrator_login_password = ${{ var.psql_pwd }} 
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "pstgrdb_dev_lunch2_aztech_kc" {
  name                = "pstgrdb-dev-lunch2-aztech-kc"
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  server_name         = azurerm_postgresql_server.pstgrsvr_dev_lunch2_aztech_kc.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}