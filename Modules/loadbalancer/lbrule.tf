resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.example.id
  name                           = "tushar-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "netflix-ip"
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.example.id ]
  probe_id = azurerm_lb_probe.example.id
}