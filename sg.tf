resource "azurerm_network_security_group" "didukh-sg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = var.location
  resource_group_name = azurerm_resource_group.didukh.name

  security_rule {
    name                       = "RDP-Allow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https-Allow"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.didukh-network-interface.id
  network_security_group_id = azurerm_network_security_group.didukh-sg.id
}