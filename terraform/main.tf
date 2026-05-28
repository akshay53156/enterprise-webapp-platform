terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-enterprise-webapp-dev"
  location = "eastus"
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = "asp-enterprise-linux-f1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "southeastasia"

  os_type  = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "enterprise-webapp-akshay"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "southeastasia"
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  https_only = true

  site_config {
    always_on = false

    application_stack {
      node_version = "22-lts"
    }
  }
}