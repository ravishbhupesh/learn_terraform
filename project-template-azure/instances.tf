resource "azurerm_public_ip" "vm-ip" {
  name                = "vm-ip"
  resource_group_name = azurerm_resource_group.ntwk-rg.name
  location            = azurerm_resource_group.ntwk-rg.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vnet-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm-ip.id
  }

  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm"
  resource_group_name = azurerm_resource_group.ntwk-rg.name
  location            = azurerm_resource_group.ntwk-rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  custom_data = filebase64("startup_script.tpl")

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("D:/work/learn_terraform/project-template-azure/ssh/azrvmkey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}