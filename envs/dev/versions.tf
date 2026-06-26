terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.35"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-euw-dev-01"
    storage_account_name = "sttfstateeuwdev01"
    container_name       = "tfstate"
    key                  = "azvm-dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_oidc        = true
}
