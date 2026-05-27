
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-enterprise-webapp-dev"
    storage_account_name = "tfstateakshay123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
