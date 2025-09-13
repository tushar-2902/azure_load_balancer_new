resource "azurerm_public_ip" "example" {
  name                = var.pip-name
  location            = var.location
  resource_group_name = var.rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
}

