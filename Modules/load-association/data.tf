data "azurerm_network_interface" "example" {
  name                = var.nic-name
  resource_group_name = var.rg-name
}

data "azurerm_lb" "example" {
  name                = var.lb-name
  resource_group_name = var.rg-name
}

data "azurerm_lb_backend_address_pool" "example" {
  name            = var.backend-pool
  loadbalancer_id = data.azurerm_lb.example.id
}

