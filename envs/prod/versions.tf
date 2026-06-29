terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.35"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-euw-prod-01"
    storage_account_name = "sttfstateeuwprod01"
    container_name       = "tfstate"
    key                  = "azvm-prod.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_oidc        = true
}
