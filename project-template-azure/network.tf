resource "azurerm_resource_group" "ntwk-rg" {
  name     = "ntwk-rg"
  location = "West Europe"
  tags     = local.common_tags
}

resource "azurerm_network_security_group" "ntwk-sg" {
  name                = "ntwk-sg"
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name

  tags = local.common_tags
}

resource "azurerm_network_security_rule" "ntwk-sg-rule" {
  name                        = "ntwk-sg-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ntwk-rg.name
  network_security_group_name = azurerm_network_security_group.ntwk-sg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
  address_space       = ["10.0.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "vnet-subnet" {
  name                 = "vnet-subnet"
  resource_group_name  = azurerm_resource_group.ntwk-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "vnet-subnet-ntwk-sg" {
  subnet_id                 = azurerm_subnet.vnet-subnet.id
  network_security_group_id = azurerm_network_security_group.ntwk-sg.id
}

resource "azurerm_public_ip" "vm-ip" {
  name                = "vm-ip"
  resource_group_name = azurerm_resource_group.ntwk-rg.name
  location            = azurerm_resource_group.ntwk-rg.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}