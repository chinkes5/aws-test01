variable "userName" {
  type        = string
  description = "Username to associate run to"
}

variable "s3_name" {
  type        = string
  description = "Name of the bucket"
}

variable "s3_acl" {
  type        = string
  description = "Access control list settings"
  default     = "private"
}

variable "s3_versioning" {
  type        = bool
  description = "Boolean to set versioning on bucket"
  default     = true
}
