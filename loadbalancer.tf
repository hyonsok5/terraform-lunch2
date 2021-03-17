### LB01


resource "azurerm_public_ip" "pip_lb_dev_lunch2_aztech_kc_001" {
  name                = "pip-lb-dev-lunch2-aztech-kc-001"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  allocation_method   = "Static"
}
  
 resource "azurerm_lb" "lb_dev_lunch2_aztech_kc_001" {
   name                = "lb-dev-lunch2-aztech-kc-001"
   location            = var.location
   resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
 
   frontend_ip_configuration {
     name                 = "frntIpLbAks001"
     public_ip_address_id = azurerm_public_ip.pip_lb_dev_lunch2_aztech_kc_001.id
   } 
 }




### LB02

resource "azurerm_public_ip" "pip_lb_dev_lunch2_aztech_kc_002" {
  name                = "pip-lb-dev-lunch2-aztech-kc-002"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  allocation_method   = "Static"
}
  
 resource "azurerm_lb" "lb_dev_lunch2_aztech_kc_002" {
   name                = "lb-dev-lunch2-aztech-kc-002"
   location            = var.location
   resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
 
   frontend_ip_configuration {
     name                 = "frntIpLbAks002"
     public_ip_address_id = azurerm_public_ip.pip_lb_dev_lunch2_aztech_kc_002.id
   } 
 }
