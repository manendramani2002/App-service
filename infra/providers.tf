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

  subscription_id = "b7961fa1-0bf5-4c4c-a981-78355f3f097e"
}