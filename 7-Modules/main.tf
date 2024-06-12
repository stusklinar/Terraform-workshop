resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location

  tags = local.tags
}


module "storage" {
  source              = "./storage-account"
  
  name                = "mystorageacocunt"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  create_locks        = false
  tags                = local.tags
}
