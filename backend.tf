terraform {
  backend "azurerm" {
    resource_group_name   = "rg-devops"
    storage_account_name  = "satfstatergnima"
    container_name        = "tfstate"
    key                   = "aks.tfstate"
  }
}