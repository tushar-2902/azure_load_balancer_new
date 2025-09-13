resource "azurerm_bastion_host" "example" {
  name                = var.bas-name
  location            = var.location
  resource_group_name = var.rg-name
  sku =  "Standard"

  ip_configuration {
    name                 = "internal"
    subnet_id            = data.azurerm_subnet.example.id
    public_ip_address_id = data.azurerm_public_ip.example.id
  }
}