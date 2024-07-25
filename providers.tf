terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
   
  } 
  

  backend "azurerm" {
    resource_group_name  = "project"
    storage_account_name = "razvan1"
    container_name       = "test"
    key                  = "key.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# provider "mysql" {
#   endpoint = azurerm_mysql_flexible_server.practicaibm.fqdn
#   username = "sqladmin@${azurerm_mysql_flexible_server.practicaibm.name}"
#   password = "H@Sh1CoR3!"
# }
