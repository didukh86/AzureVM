resource "azurerm_virtual_network" "didukh-network" {
  name                = "${var.prefix}-network"
  address_space       = ["192.168.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.didukh.name
}

resource "azurerm_subnet" "didukh-internal-subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.didukh.name
  virtual_network_name = azurerm_virtual_network.didukh-network.name
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_network_interface" "didukh-network-interface" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.didukh.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.didukh-internal-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.didukh-public-ip.id
  }
}

resource "azurerm_public_ip" "didukh-public-ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.didukh.name
  location            = var.location
  allocation_method   = "Dynamic"
}