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
  type    = string
  default = "friends-capstone-infra-s3-website.s3.us-west-2.amazonaws.com"
}

variable "api_gateway_arn" {
  type        = string
  description = "arn of the api_gateway stage"
  default     = "arn:aws:apigateway:us-west-2::/restapis/ybqb8ftiy3/stages/dev"
}

variable "application_load_balancer_arn" {
  type        = string
  description = "arn of the application_load_balancer stage"
  default     = "arn:aws:elasticloadbalancing:us-west-2:255945442255:loadbalancer/app/friends-capstone-ecs-shared-alb/c1e262c436e26421"
}