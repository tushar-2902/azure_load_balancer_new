resource "azurerm_lb" "example" {
  name                = "tushar-lb"
  location            = "West Europe"
  resource_group_name = "tushar-rg"

  frontend_ip_configuration {
    name                 = "netflix-ip"
    public_ip_address_id = data.azurerm_public_ip.example.id
  }
}

data "azurerm_public_ip" "example" {
  name                = "tushar-load-pip"
  resource_group_name = "tushar-rg"
}