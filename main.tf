# This is my first change!

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
  cloud {
    organization = "Tridi"

    workspaces {
      name = "terra-house-1"
    }
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

 # https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower            = true
  upper            = false
  length           = 32
  special          = false
}

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  #Bucket naming rules
  bucket = random_string.bucket_name.result
}
 

output "random_bucket_name" {
  value = random_string.bucket_name.result
}

# This is my second change!


