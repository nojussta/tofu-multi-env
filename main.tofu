resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = "West Europe"
}

module "storage-account" {
  source = "./modules/storage-account"

  for_each             = local.storage_accounts
  storage_account_name = each.value.name
  rg_name              = azurerm_resource_group.rg.name
  rg_location          = azurerm_resource_group.rg.location
}
