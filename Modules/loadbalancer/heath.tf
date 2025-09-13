resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.example.id
  name            = "netflix-probe"
  protocol            = "Tcp"
  port            = 80
}