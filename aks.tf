

resource "azurerm_kubernetes_cluster" "aks_dev_lunch2_aztech_kc" {
  name                = "aks-dev-lunch2-aztech-kc"
  resource_group_name      = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  location                 = var.location
  dns_prefix          = "lunch-admin-k8s"
   
  default_node_pool {
    name            = "default"
    node_count      = 2   
    vm_size         = "Standard_A2_v2"
    os_disk_size_gb = 30
  }   
    
  service_principal {
    client_id     = var.client_id  
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

}

resource "azurerm_public_ip" "pip_dev_aflunch2_aztech_kc" {
  name                = "pip-dev-aflunch2-aztech-kc"
  resource_group_name      = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  location                 = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}  

resource "azurerm_public_ip" "pip_dev_ablunch2_aztech_kc" {
  name                = "pip-dev-ablunch2-aztech-kc"
  resource_group_name      = data.azurerm_resource_group.aks_lunch2gether_rg.name
  location                 = var.location  
  allocation_method   = "Static"

  tags = { 
    environment = "Production"
  }
}
