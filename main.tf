provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_msi         = true
}

resource "azurerm_resource_group" "rg" {
  name     = "jenkins-terraform-rg"
  location = "East US"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "jenkins-terraform-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"      # Specify the OS type
  sku_name            = "B1"         # Basic tier, size B1
}

resource "azurerm_app_service" "app_service" {
  name                = "jenkins-terraform-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id

  app_settings = {
    WEBSITES_PORT = "3000"
  }

  site_config {
    linux_fx_version = "PYTHON|3.9"
    always_on = "true"


  }
}
