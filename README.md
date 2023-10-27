# Terraform Beginner Bootcamp 2023

![268042721-ab015431-2d14-4910-aa37-be4807b2b905](https://github.com/TrimYmeraga92/terraform-beginner-bootcamp-2023/assets/71897922/2a98d851-37f4-42b3-afd3-b889e14aad76)


## Weekly Journals
- [Week 0 Journal](journal/week0.md)
- [Week 1 Journal](journal/week1.md)


-[Github Markdown TOC Generator](https://ecotrust-canada.github.io/markdown/toc/)




## Dealing with Configuration Drift

### What happend if we lose our state file?

If you lose your statefile, you most likely have to tear down all your cloud infrastructure manually 

You can use tf import but it wont work for all resources, you need to check the terraform providers documentation for which resources support tf import.

### Fix Missing Resources Terraform Import

`terraform import aws_s3_bucket.example`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)


### Fix Manual Configuration

If someone goes and delete or modifies cloud resources manually through clickops.

If we run Terraform plan is with attmept to put our Infrastructure back into the expected state fixing Configuration Drift

