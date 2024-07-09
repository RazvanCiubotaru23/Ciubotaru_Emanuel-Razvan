
resource "azurerm_network_interface" "nic" {
  count               = 2
  name                = "net-if-${count.index + 1}"
  location            = azurerm_resource_group.proj.location
  resource_group_name = azurerm_resource_group.proj.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mtc-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mtc-pub_ip[count.index].id

  }

  depends_on = [
    azurerm_subnet.mtc-subnet,
    azurerm_public_ip.mtc-pub_ip 
  ]
}


