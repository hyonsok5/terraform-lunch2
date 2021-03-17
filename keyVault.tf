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
    object_id = "455be9ba-a675-4e4f-801a-c0080f9aa6c1" // function app

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

  access_policy {
      tenant_id = var.tenant_id
      object_id = "de6716e9-0cfb-47e0-bd53-72e59099b3f3" // hyonsok

      key_permissions = [
        "Get","Create","List","Delete"
        ]

        secret_permissions = [
       "Get","Create","List","Delete"
        ]

        storage_permissions = [
       "Get","Create","List","Delete"
        ]
  }
}