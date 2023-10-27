terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
    #   }
    #   cloud {
    #     organization = "Tridi"

    #     workspaces {
    #       name = "terra-house-1"
    #     }
    #   }
  }
}


provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

provider "random" {
  # Configuration options
}