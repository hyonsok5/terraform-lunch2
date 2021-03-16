locals {
  container_key = var.strg_cntr_key
}

terraform {
  required_version = ">= 0.12"
   
  backend "azurerm" {     
    resource_group_name = "rg-dev-lunch2-aztech-kc"
    storage_account_name  = "stortfstatelunch2"
    container_name        = "cntrtfstatelunch2"
    #key                   = local.container_key
  }  

}         
    
provider "azurerm" {
    features {}
}  
