

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


resource "azurerm_public_ip" "pip_lb_dev_lunch2_aztech_kc_001" {
  name                = "pip-lb-dev-lunch2-aztech-kc-001"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "pip_lb_dev_lunch2_aztech_kc_002" {
  name                = "pip-lb-dev-lunch2-aztech-kc-002"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  allocation_method   = "Static"
}
