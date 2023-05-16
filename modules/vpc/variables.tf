variable "userName" {
  type        = string
  description = "Username to associate run to"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr_range" {
  type        = string
  description = "The CIDR range for this VPC"
}

variable "az" {
  type        = string
  description = "Which AZ your VPC will be in"
}

variable "private_subnet" {
  type        = string
  description = "Private Subnet CIDR"
}

variable "public_subnet" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "Env" {
  type        = string
  description = "The Environment Tag for this VPC"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Boolean to allow Nat Gateway in this VPC, or not"
  default     = true
}

variable "tags" {
  type        = map(any)
  description = "Tags to associate to the VPC"
  default = {
    Terraform = "true"
  }
}
