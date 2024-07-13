resource "azurerm_container_registry" "c-reg" {
  name                     = "practica"  
  resource_group_name      = azurerm_resource_group.proj.name
  location                 = azurerm_resource_group.proj.location
  sku                      = "Basic"  
  admin_enabled            = true
}
