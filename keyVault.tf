resource "azurerm_key_vault" "kv_dev_lunch2_aztech_kc" {
  name                        = "kv-dev-lunch2-aztech-kc"
  location                    = var.location
  resource_group_name         = data.azurerm_resource_group.rg_dev_lunch2_aztech_kc.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = "455be9ba-a675-4e4f-801a-c0080f9aa6c1"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}