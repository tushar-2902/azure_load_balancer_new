resource "azurerm_network_security_group" "example" {
  name                = var.nsg-name
  location            = var.location
  resource_group_name = var.rg-name
}

resource "azurerm_network_security_rule" "allow_http" {
  name                        = "Allow-HTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg-name
  network_security_group_name =  azurerm_network_security_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = var.rg-name
  address_space       = var.address-space
}
