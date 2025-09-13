resource "azurerm_network_interface_backend_address_pool_association" "example" {
  network_interface_id    = data.azurerm_network_interface.example.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.example.id
}