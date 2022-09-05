resource "azurerm_resource_group" "resource_group" {

  name     = "vnet"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  count = var.envioronment == "prod" ? 1 : 0

  name                = "vnet-express"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = ["10.0.0.0/16"]

  tags = local.common_tags
}

