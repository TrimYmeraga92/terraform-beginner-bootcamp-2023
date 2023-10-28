output "bucket_name" {
  value       = module.terrahouse_aws.bucket_name
  description = "Confirmed name of the AWS S3 bucket"
}