resource "azurerm_mysql_flexible_database" "main" {
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
  name                = "mysqlfsdb"
  resource_group_name = azurerm_resource_group.proj.name
  server_name         = azurerm_mysql_flexible_server.practicaibm.name
}