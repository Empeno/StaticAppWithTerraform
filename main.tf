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


ata "github_repository" "poc" {
  full_name = "Empeno/StaticAppWithTerraform"
}

// Create secrets in a single poc repo
resource "github_actions_secret" "my_secret" {
  repository      = data.github_repository.poc.name
  secret_name     = "SECRET_KEY"
  plaintext_value = "123"
}