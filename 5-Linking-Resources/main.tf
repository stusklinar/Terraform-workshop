resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location
  
  tags = local.tags
}

resource "azurerm_storage_account" "this" {
  name                     = "stusstorageaccount"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}