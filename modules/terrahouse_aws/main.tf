terraform {
 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
 }
}

provider "aws" {
  region     = "us-east-1"
  
}
#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string


#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}