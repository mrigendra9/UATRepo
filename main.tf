resource "azurerm_resource_group" "rg" {
name = "rg-uatrepo"
location = "west europe"
}

resource "azurerm_resource_group" "ayush" {
  name = "ayush-test-rg"
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


resource "azurerm_resource_group" "rgname1" {
  name = "rgname-uat1"
  location = "West India"
}

resource "azurerm_virtual_network" "vnet" {
name = "uatrepo-vnet"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
address_space = [ "192.168.10.0/24" ]
# dns_servers = "192.168.10.11"
}

resource "azurerm_subnet" "subnet" {
  name = "subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = "192.168.10.0/24" 
}
resource "azurerm_subnet" "subnet1" {
  name = "subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = "192.168.11.0/24"
 
}

resource "azurerm_subnet" "subnet2" {
  name = "subnet12"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = "192.168.12.0/24"
 
}


