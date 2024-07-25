resource "azurerm_mysql_flexible_database" "main" {
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
  name                = "mysqlfsdb"
  resource_group_name = azurerm_resource_group.proj.name
  server_name         = azurerm_mysql_flexible_server.practicaibm.name
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# resource "null_resource" "add_blob_column" {
#   provisioner "local-exec" {
#     command = <<EOT
#     mysql -h ${azurerm_mysql_flexible_server.practicaibm.fqdn} \
#     -u ${azurerm_mysql_flexible_server.practicaibm.administrator_login} \
#     -p${azurerm_mysql_flexible_server.practicaibm.administrator_password} \
#     -D main\
#     -e "ALTER TABLE mysqlfsdb; ADD COLUMN img1 BLOB;"
#     EOT
#   }
# }
