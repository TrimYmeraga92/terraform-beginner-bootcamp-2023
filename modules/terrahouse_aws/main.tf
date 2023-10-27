terraform {
 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
 }
}

# provider "aws" {
# #   region     = "us-east-1"
# #   access_key = ""
# #   secret_key = ""
# }
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  #Bucket naming rules
  bucket = var.bucket_name
tags = {
  UserUuid = var.user_uuid
}
}
