variable "user_uuid" {
  description = "User UUID"
  type        = string
}

variable "bucket_name" {
  type        = string
  description = "Name of the AWS S3 bucket"
}


variable "index_html_filepath" {
  type = string
}


variable "error_html_filepath" {
  type = string
}
