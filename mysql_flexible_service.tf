resource "azurerm_mysql_flexible_server" "practicaibm" {
  name                   = "practicaibm"
  resource_group_name    = azurerm_resource_group.proj.name
  location               = "North Europe"
  administrator_login    = "sqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  sku_name               = "B_Standard_B1ms"
  zone                   = "2"
}
