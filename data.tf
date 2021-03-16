
data "azurerm_resource_group" "rg_dev_lunch2_aztech_kc" {
   name = "rg-dev-lunch2-aztech-kc"
 }

data "azurerm_storage_account" "stortfstatelunch2" {
  name                = "stortfstatelunch2"
  resource_group_name = "rg-dev-lunch2-aztech-kc"
} 