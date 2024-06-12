resource "azurerm_storage_account" "this" {
  name                     = "str${var.name}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.tags
}

resource "azurerm_management_lock" "storage_account_lock" {
  count = var.create_locks ? 1 : 0

  name       = "storage-lock"
  scope      = azurerm_storage_account.this.id
  lock_level = "CanNotDelete"
  notes      = "Lock required for production resources"
}