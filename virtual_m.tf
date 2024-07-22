
resource "azurerm_linux_virtual_machine" "vm" {
  count               = 3
  name                = "vm-mtc-${count.index}"
  resource_group_name = azurerm_resource_group.proj.name
  location            = azurerm_resource_group.proj.location

  admin_username = "adminuser"
  admin_password = random_password.password.result


  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  size = "Standard_B1s"

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

  computer_name                   = "hostname${count.index + 1}"#si aici as vrea ca numerotarea sa inceapa de la 1
  disable_password_authentication = false
}
#docker pull  razvan69/practica:0.0.1-SNAPSHOT