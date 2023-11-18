variable "proj_name" {
  type    = string
  default = "friends-capstone"
}

variable "s3_bucket_website_name" {
  type        = string
  description = "name of s3 bucket website name"
  default     = "friends-capstone-infra-s3-website"
}

variable "s3_bucket_images_name" {
  type        = string
  description = "name of s3 bucket images name"
  default     = "friends-capstone-infra-s3-images"
}

variable "s3_bucket_static_website_domain_name" {
  type        = string
  default     = "friends-capstone-infra-s3-website.s3.us-west-2.amazonaws.com"
}