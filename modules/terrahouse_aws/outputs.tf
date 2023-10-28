output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
  description = "Confirmed name of the AWS S3 bucket"
}

output "s3_website_enpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration
  description = "S3 static website hosting endpoint"
}


