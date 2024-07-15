

resource "azurerm_public_ip" "mtc-pub_ip" {
  count               = 3
  name                = "pub_ip-${count.index}"
  resource_group_name = azurerm_resource_group.proj.name
  location            = azurerm_resource_group.proj.location
  allocation_method   = "Static"
  tags = {
    environment = "Production"
  }
}
