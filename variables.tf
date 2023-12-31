variable "proj_name" {
  type    = string
  default = "friends-capstone"
}

variable "s3_bucket_website_domain_name" {
  type    = string
  default = "friends-capstone-infra-s3-website.s3-website-us-west-2.amazonaws.com"
}

variable "s3_bucket_images_domain_name" {
  type    = string
  default = "friends-capstone-infra-s3-images.s3.us-west-2.amazonaws.com"
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

variable "application_load_balancer_domain_name" {
  type        = string
  description = "domain name of the application_load_balancer stage"
  default     = "friends-capstone-ecs-shared-alb-2059628003.us-west-2.elb.amazonaws.com"
}