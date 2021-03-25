resource "azurerm_virtual_network" "vnet_dev_lunch2_aztech_kc" {
  name                = "vnet-dev-lunch2-aztech-kc"
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  location            = var.location
  address_space       = ["10.1.1.0/25"]
}

resource "azurerm_subnet" "snet_es_dev_lunch2_aztech_kc" {
  name                 = "snet-es-dev-lunch2-aztech-kc"
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  virtual_network_name = azurerm_virtual_network.vnet_dev_lunch2_aztech_kc.name
  address_prefixes     = ["10.1.1.0/26"]
} 

resource "azurerm_public_ip" "pip_dev_eslunch2_aztech_kc" {
  name                = "pip-dev-eslunch2-aztech-kc"
  resource_group_name      = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  location                 = var.location
  allocation_method   = "Dynamic"
}  

resource "azurerm_network_interface" "nic_es_dev_lunch2_aztech_kc" {
  name                = "nic-es-dev-lunch2-aztech-kc"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.snet_es_dev_lunch2_aztech_kc.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_dev_eslunch2_aztech_kc.id
  }
}



# resource "azurerm_linux_virtual_machine" "vm_es_dev_lunch2_aztech_kc" {
#   name                = "vm-es-dev-lunch2-aztech-kc"
#   resource_group_name = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
#   location            = var.location
#   size                = "Standard_B2s"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.nic_es_dev_lunch2_aztech_kc.id,
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   # os_profile {
#   #   computer_name  = "vm-es-dev-lunch2-aztech-kc"
#   #   admin_username = "testadmin"
#   #   admin_password = "Password1234!"
#   # }
#   # os_profile_linux_config {
#   #   disable_password_authentication = false
#   # }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
# }



resource "azurerm_virtual_machine" "vm_es_dev_lunch2_aztech_kc" {
  name                  = "vm-es-dev-lunch2-aztech-kc"
  location              = var.location
  resource_group_name   = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  network_interface_ids = [azurerm_network_interface.nic_es_dev_lunch2_aztech_kc.id]
  vm_size               = "Standard_B2s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vm-es-dev-lunch2-aztech-kc"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}
