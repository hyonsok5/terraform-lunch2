resource "azurerm_public_ip" "pip_lb1_dev_lunch2_aztech_kc" {
  name                = "pip-lb1-dev-lunch2-aztech-kc"
  location            = var.region
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  allocation_method   = "Static"
}
  
 resource "azurerm_lb" "lb_dev_lunch2_aztech_kc" {
   name                = "lb-dev-lunch2-aztech-kc"
   location            = var.region
   resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
 
   frontend_ip_configuration {
     name                 = "frntIpLbAks"
     public_ip_address_id = azurerm_public_ip.pip_lb1_dev_lunch2_aztech_kc.id
   } 
 }