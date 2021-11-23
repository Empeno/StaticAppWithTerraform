provider "azurerm" {
  version = "=2.85.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformState"
    storage_account_name = "dkterraformsa"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "StaticAppWithTerraformRG" {
  name     = "StaticAppWithTerraformRG"
  location = "westeurope"
}

resource "azurerm_static_site" "StaticAppWithTerraform" {
  name                = "StaticAppWithTerraform"
  resource_group_name = azurerm_resource_group.StaticAppWithTerraformRG.name
  location            = azurerm_resource_group.StaticAppWithTerraformRG.location
  sku_tier            = "Free" 
  tags = {
        "owner"       = "Empeño"
    }
}