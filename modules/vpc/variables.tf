variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr_range" {
  type        = string
  description = "The CIDR range for this VPC"
}

variable "azs" {
  type        = map(string)
  description = "Which AZ your VPC will be in"
}

variable "private_subnets" {
  type        = map(string)
  description = "Private Subnet CIDR"
}

variable "public_subnets" {
  type        = map(string)
  description = "Public Subnet CIDR"
}

variable "Env" {
  type        = string
  description = "The Environment Tag for this VPC"
}
