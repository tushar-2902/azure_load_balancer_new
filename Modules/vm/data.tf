data "azurerm_network_security_group" "example" {
  name                = var.nsg-name
  resource_group_name = var.rg-name
}


data "azurerm_subnet" "example" {
  name                 = "tushar-sb"
  virtual_network_name = var.vnet-name
  resource_group_name  = var.rg-name
}
