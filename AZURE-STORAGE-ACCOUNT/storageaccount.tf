resource "azurerm_resource_group" "fisrt_resource_group" {
  name     = "remote-state"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "first_storage_account" {
  name                     = "humbertostorageaccount"
  resource_group_name      = azurerm_resource_group.fisrt_resource_group.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  blob_properties {

    versioning_enabled = true
  }

  tags = local.common_tags

}

resource "azurerm_storage_container" "first_container" {
  name                 = "imagens"
  storage_account_name = azurerm_storage_account.first_storage_account.name

}