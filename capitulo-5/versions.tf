terraform {
  required_version = "~> 1.10" # Versão mínima do Terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "xpe-terraform"
}

provider "azurerm" {
  features {}
}