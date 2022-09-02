terraform {


  required_version = ">=1.0.0"


  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.19.1"
    }
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "remote-state2"
    storage_account_name = "humbertostoremotestate"
    container_name       = "remote-state"
    key                  = "azure-vm-provisiones/terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "remote-state2"
    storage_account_name = "humbertostoremotestate"
    container_name       = "remote-state"
    key                  = "azure-venet/terraform.tfstate"
  }
}
