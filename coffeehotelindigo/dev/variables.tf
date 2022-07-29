variable "vers" {
  description = "bucketpolicy string"
  type        = string
  default = "2012-10-17"
}

variable "si" {
  description = "bucketpolicy string"
  type        = string
  default = "PublicReadGetObject"
}



variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
