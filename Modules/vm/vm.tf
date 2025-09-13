resource "azurerm_network_interface" "example" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = data.azurerm_network_security_group.example.id
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm-name
  resource_group_name = var.rg-name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.admin-name
  admin_password       =     var.admin-password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}



