data "azurerm_resource_group" "this" {
  name = "rg-data"
}


resource "azurerm_storage_account" "this" {
  name                     = "stusstorageaccounttwo"
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = data.azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}
