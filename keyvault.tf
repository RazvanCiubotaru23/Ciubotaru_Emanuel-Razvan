
#TO DO 
#data "azurerm_client_config" "current" {}
# output "tenant_id" {
#   value = data.azurerm_client_config.current.tenant_id
# }

# output "object_id" {
#   value = data.azurerm_client_config.current.object_id
# }

# resource "azurerm_key_vault" "keyvlt1" {
#   name                       = "keyvlt1"
#   location                   = azurerm_resource_group.proj.location
#   resource_group_name        = azurerm_resource_group.proj.name
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   sku_name                   = "standard"
#   soft_delete_retention_days = 7

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Create",
#       "Get",
#     ]

#     secret_permissions = [
#       "Set",
#       "Get",
#     ]
#   }
# }

# resource "azurerm_key_vault_secret" "mktvmpass" {
#   name         = "mktvmpass"
#   value        = "admin"
#   key_vault_id = azurerm_key_vault.keyvlt1.id
#   depends_on=[
#     azurerm_key_vault.keyvlt1
#     ]
# }

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
output "password" {
  
  value     = random_password.password.result
  sensitive = true
  }
