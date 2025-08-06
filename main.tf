resource "azurerm_resource_group" "rg" {
name = "rg-uatrepo"
location = "west europe"
}

resource "azurerm_storage_account" "storage" {
  name = "uatrepostorage01"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account" "storage1" {
  name = "uatrepostorage02"
  resource_group_name = "rg-uatrepo"
  location = "west europe"
  account_tier = "Standard"
  account_replication_type = "LRS"
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_resource_group" "rgname" {
  name = "rgname-uat"
  location = "West India"
}