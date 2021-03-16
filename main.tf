

terraform {
  required_version = ">= 0.12"
   
  backend "azurerm" {     
    resource_group_name = "rg-dev-lunch2-aztech-kc"
    storage_account_name  = "stortfstatelunch2"
    container_name        = "cntrtfstatelunch2"
  }  
 
}         
    
provider "azurerm" {
    subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
    features {}
}   
