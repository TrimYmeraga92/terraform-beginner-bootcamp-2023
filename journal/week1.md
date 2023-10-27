# Terraform Beginner Bootcamp 2023 - Week 1


## Root Module Structure


Our root module structure is as follows:

```
PROJECT_ROOT
|-- main.tf - everything else.
|-- variables.tf - stores the structure of input variables
|-- providers.tf - defined required providers and their configuration
|-- outputs.tf - stores our outputs
|-- terraform.tvvars - the data of variables we want to load into our Terraform project
|-- Readme.md - required for root modules
```



-[Standard Module Structure] (https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and input variables

### Terraform Cloud Variables

in terraform we can set two kind of variables:

- Environment Variables - those you would set in your bash terminal eg. AWS Credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibly in the UI.


### Loading Terraform input variables


#### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

#### var-file flag

To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file:


#### terraform.tfvars

This is the default file to load in therraform variables in blunk 

#### auto.tfvars

Variables in the Terraform Cloud workspace and variables provided through the command line always overwrite variables with the same key from files ending in `.auto.tfvars.`


## Dealing with Configuration Drift

### What happend if we lose our state file?

If you lose your statefile, you most likely have to tear down all your cloud infrastructure manually 

You can use tf import but it wont work for all resources, you need to check the terraform providers documentation for which resources support tf import.

### Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve

```

### Fix Missing Resources Terraform Import

`terraform import aws_s3_bucket.example`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)


### Fix Manual Configuration

If someone goes and delete or modifies cloud resources manually through clickops.


If we run Terraform plan is with attmept to put our Infrastructure back into the expected state fixing Configuration Drift


## Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variable in its own variable.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  
}
```

### Modules Source


using the source we can importe the module from various places eg:

-locally
-Github
-Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

[Modules Sources](https://developer.hashicorp.com/terraform/language/modules)



