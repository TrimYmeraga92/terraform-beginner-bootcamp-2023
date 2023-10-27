variable "user_uuid" {
  description = "User UUID"
  type        = string

#   validation {
#     condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.user_uuid))
#     error_message = "user_uuid is not in the correct format (e.g., 123e4567-e89b-12d3-a456-426655440000)"
#   }
}

variable "bucket_name" {
  type        = string
  description = "Name of the AWS S3 bucket"

  validation {
    condition = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "The bucket name must be between 3 and 63 characters long"
  }

  validation {
    condition     = can(regex("^([a-z0-9]+)(-[a-z0-9]+)*$", var.bucket_name))
    error_message = "The bucket name must consist of lowercase alphanumeric characters and hyphens, and should follow DNS naming conventions."
  }
}
