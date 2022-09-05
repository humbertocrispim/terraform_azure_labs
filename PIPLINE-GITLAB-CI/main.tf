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
    key                  = "pipline-gitlab-ci/terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}


provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      owner      = "danielgil"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "curso-terraform-humbertocc"
    key    = "aws-vpc/terraform.tfstate"
    region = "eu-central-1"
  }
}