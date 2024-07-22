
resource "azurerm_resource_group" "proj" {
  name     = "project"
  location = "West Europe" 
}
#virtual network
resource "azurerm_virtual_network" "vi-net" {
  address_space       = ["10.0.0.0/16"]
  name                = "virtual_net"
  location            = azurerm_resource_group.proj.location
  resource_group_name = azurerm_resource_group.proj.name
  tags = {
    environment = "dev"
  }
}
#subneta
resource "azurerm_subnet" "mtc-subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.proj.name
  virtual_network_name = azurerm_virtual_network.vi-net.name
  address_prefixes     = ["10.0.1.0/24"]
}