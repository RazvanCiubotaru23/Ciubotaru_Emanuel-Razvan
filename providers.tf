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

