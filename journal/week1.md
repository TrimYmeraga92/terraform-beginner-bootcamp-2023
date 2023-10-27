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


