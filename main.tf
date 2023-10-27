terraform {

  # terraform {
  #   backend "remote" {
  #     organization = "example_corp"

  #     workspaces {
  #       name = "my-app-prod"
  #     }
  #   }
  # }


  #   cloud {
  #     organization = "Tridi"

  #     workspaces {
  #       name = "terra-house-1"
  #     }
  #   }
}


module "terrahouse_aws" {
  source      = "./modules/terrahouse_aws"
  user_uuid   = var.user_uuid
  bucket_name = var.bucket_name

}






