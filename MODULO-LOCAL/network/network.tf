resource "azurerm_resource_group" "resource_group" {
  name     = "vnet"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.cidr_network

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.environment}"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.cidr_subnet

}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "snsga" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}