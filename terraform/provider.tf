terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure microsoft azure provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

