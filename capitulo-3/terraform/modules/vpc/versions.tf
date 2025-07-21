terraform {
  required_version = "~> 1.10" # Versão mínima do Terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}