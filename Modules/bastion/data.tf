data "azurerm_subnet" "example" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = var.vnet-name
  resource_group_name  = var.rg-name
}

data "azurerm_public_ip" "example" {
  name                = "tushar-bas-pip"
  resource_group_name = var.rg-name
}


