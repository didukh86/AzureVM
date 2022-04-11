resource "azurerm_windows_virtual_machine" "didukh-vm" {
  name                = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.didukh.name
  location            = var.location
  size                = var.vm-size
  admin_username      = var.username
  admin_password      = var.password
  network_interface_ids = [
    azurerm_network_interface.didukh-network-interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
