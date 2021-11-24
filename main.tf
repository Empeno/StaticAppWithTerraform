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
}


resource "github_actions_secret" "example_secret1" {
  repository       = "Empeno/StaticAppWithTerraform"
  secret_name      = "example_secret_name1"
  plaintext_value  = "Bent Butg"
}

resource "github_actions_secret" "example_secret2" {
  repository       = "Empeno/StaticAppWithTerraform"
  secret_name      = "example_secret_name2"
  encrypted_value  = "Keld H"
}