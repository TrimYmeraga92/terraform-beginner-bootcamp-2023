terraform {
  required_providers {
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