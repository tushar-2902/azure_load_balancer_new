resource "azurerm_subnet" "example" {
  name                 = var.sb-name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = var.address-prefixes
}



