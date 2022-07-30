variable "domain_name" {
  description = "domain name (or application name if no domain name available)"
  default = null
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "tags for all the resources, if any"
}

variable "hosted_zone" {
  default     = "cloudtoday.click"
  description = "Route53 hosted zone"
}

variable "acm_certificate_domain" {
  default     = "cloudtoday.click"
  description = "Domain of the ACM certificate"
}

variable "price_class" {
  default     = "PriceClass_100" // Only US,Canada,Europe
  description = "CloudFront distribution price class"
}

variable "use_default_domain" {
  default     = false
  description = "Use CloudFront website address without Route53 and ACM certificate"
}

variable "upload_sample_file" {
  default     = false
  description = "Upload sample html file to s3 bucket"
}

# All values for the TTL are important when uploading static content that changes
# https://stackoverflow.com/questions/67845341/cloudfront-s3-etag-possible-for-cloudfront-to-send-updated-s3-object-before-t
variable "cloudfront_min_ttl" {
  default     = 0
  description = "The minimum TTL for the cloudfront cache"
}

variable "cloudfront_default_ttl" {
  default     = 86400
  description = "The default TTL for the cloudfront cache"
}

variable "cloudfront_max_ttl" {
  default     = 31536000
  description = "The maximum TTL for the cloudfront cache"
}

variable "provider_region" {
  default     = "ap-south-1"
  description = "provider_region_for_cloudfront"
}

variable "validation_method" {
  default     = "DNS"
}

variable "iam_policy_sid" {
  default     = 1
}

variable "iam_policy_getobject" {
  default     = "s3:GetObject"
}

variable "iam_policy_principles" {
  default     = "AWS"
}

variable "aws_s3_bucket_acl" {
  default  = "private"
}

variable "bucketversoning_status" {
  default  = "Enabled"
}

variable "s3bucket_object" {
  type = string
  default  = "index.html"
}

variable "s3bucket_content" {
  type = string
  default  = "text/html"
}

variable "awsroute53_zone" {
  default  = "false"
}

variable "zoneid_type" {
  default  = "A"
}

variable "cloudfront_origin" {
  default  = "s3-cloudfront"
}

variable "cloudfront_enabled" {
  default  = "true"
}

variable "ssl_supportmethod" {
  default  = "sni-only"
}

variable "minimum_protocol" {
  default  = "TLSv1"
}

variable "error_code" {
  default  = 403
}

variable "response_code" {
  default  = 200
}

variable "error_caching" {
  default  = 0
}

variable "restrict_type" {
  default  = "none"
}

variable "aws_region" {
  default  = "ap-south-1"
}

variable "zonid" {}

variable "acm_certificate" {}

variable "bucket_name" {}

variable "env" {}

variable "acl" {}

variable "versioning" {}

